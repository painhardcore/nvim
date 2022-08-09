local nnoremap = require("painhardcore.keymap").nnoremap
local vnoremap = require("painhardcore.keymap").vnoremap
-- 
nnoremap("<leader>pv","<cmd>Ex<Cr>")

-- telescope search
nnoremap("<Leader>b",require('telescope').extensions.file_browser.file_browser)
nnoremap("<Leader>t",require('telescope.builtin').treesitter)
nnoremap("<Leader>f", require('telescope.builtin').find_files)
nnoremap("<Leader>g", require('telescope.builtin').live_grep)
nnoremap("<Leader>b", require('telescope.builtin').buffers)
-- buffers

nnoremap("]b", "<cmd>BufferLineCycleNext<CR>", { silent = true })
nnoremap("[b", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
nnoremap("<Leader>bp", "<cmd>BufferLinePick<CR>", { silent = true })
nnoremap("<Leader>bc", "<cmd>BufferLinePickClose<CR>", { silent = true })
nnoremap("<Leader>bd", "<cmd>bd<CR>")
-- Dashboard
nnoremap("<Leader>n", ":DashboardNewFile<CR>", { silent = true })

-- Misc
nnoremap("<Leader>c", ":Commentary<CR>", { silent = true })
vnoremap("<Leader>c", ":Commentary<CR>", { silent = true })

nnoremap("<Leader>x", require("lsp_lines").toggle)
