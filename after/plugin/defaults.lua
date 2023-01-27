-- helper function to easy mapping
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- enable line number relative
vim.opt.relativenumber = true
-- share pasteboard globally
vim.o.clipboard = 'unnamedplus'
-- flip relativenumber on insert mode
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 100
-- could be buggy, use :redraw to deal with them
vim.o.lazyredraw = true


local servers = {
  -- clangd = {},
  gopls = {
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
    init_options = {
      usePlaceholder = true
    },
  },
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
-- Golang
local function OrgImports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

-- enable things on save slightly diffent for Golang
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
    OrgImports(1000)
  end,
})

-- enable things on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format()
  end,
}
)

-- treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "css",
    "go",
    "html",
    "lua",
    "make",
    "typescript",
    "yaml",
    "python",
  },
  highlight = { enable = true },
}

-- worktree setup
--
nmap("<Leader>zl", require('telescope').extensions.git_worktree.git_worktrees)
nmap("<Leader>zc", require('telescope').extensions.git_worktree.create_git_worktree)

require("telescope").load_extension("git_worktree")
