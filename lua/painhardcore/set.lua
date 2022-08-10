vim.opt.guicursor = ""
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.autoread = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50


vim.opt.colorcolumn = "120"

vim.g.mapleader = " "
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.scrolloff = 4
vim.o.splitbelow = true
vim.o.splitright = true

vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", pattern = "*" })
vim.api.nvim_create_autocmd("BufWinEnter", { command = "set noexpandtab tabstop=2 shiftwidth=2", pattern = "*.rs" })

vim.o.clipboard = "unnamedplus"
vim.opt.guifont = "Source Code Pro,Hack Nerd Font:h15"
