local nnoremap = require("painhardcore.keymap").nnoremap
local vnoremap = require("painhardcore.keymap").vnoremap
-- 
nnoremap("<leader>pv","<cmd>Ex<Cr>")

-- telescope search
nnoremap("<Leader>b",require('telescope').extensions.file_browser.file_browser)
nnoremap("<Leader>t",require('telescope.builtin').treesitter)
nnoremap("<Leader>f", require('telescope.builtin').find_files)
nnoremap("<Leader>g", require('telescope.builtin').live_grep)
nnoremap("<Leader>bb", require('telescope.builtin').buffers)
nnoremap("<Leader>zz", require('telescope').extensions.git_worktree.git_worktrees)
nnoremap("<Leader>z", require('telescope').extensions.git_worktree.create_git_worktree)
-- splits
nnoremap("<Leader>w", "<C-w>k")
nnoremap("<Leader>a", "<C-w>h")
nnoremap("<Leader>s", "<C-w>j")
nnoremap("<Leader>d", "<C-w>l")
-- buffers
nnoremap("<Leader>j", ":bprevious<CR>", { silent = true })
nnoremap("<Leader>k", ":bnext<CR>", { silent = true })
nnoremap("<Leader>q", ":bprevious<CR>:bdelete #<CR>", { silent = true })


-- Dashboard
nnoremap("<Leader>n", ":DashboardNewFile<CR>", { silent = true })

-- Misc
-- unbound space because it's mine <leader>
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- copy the whole file
nnoremap("<Leader>y", ":%y<CR>")
-- open the terminal and turn to the normal mode
nnoremap("<Leader>l", ":vsplit term://zsh <CR>", { silent = true })
-- escape in the terminal split
vim.keymap.set("t", "<Leader><Esc>", "<C-\\><C-n>", { silent = true })
-- comment one line or whole selection
nnoremap("<Leader>c", ":Commentary<CR>", { silent = true })
vnoremap("<Leader>c", ":Commentary<CR>", { silent = true })
-- tooggle to see if pointer to the problem spot is annoying
nnoremap("<Leader>x", require("lsp_lines").toggle)
-- find and replace on the cursor
nnoremap("<Leader>sf",':%s/\\<<C-r><C-w>\\>//g<Left><Left>')

