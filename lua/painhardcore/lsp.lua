local servers = {
	"bashls",
	"gopls",
	"sumneko_lua",
}
local has_formatter = { "gopls", "sumneko_lua" }
for _, name in pairs(servers) do
	local found, server = require("nvim-lsp-installer").get_server(name)
	if found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

local setup_server = {
	sumneko_lua = function(opts)
		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
	end,
    gopls = function(opts)
        opts.settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        }
        opts.init_options = {
            usePlaceholders = true,
        }
    end,
}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr}
			vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, opts)
			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = capabilities,
	}
	if setup_server[server.name] then
		setup_server[server.name](opts)
	end
	server:setup(opts)
end)

