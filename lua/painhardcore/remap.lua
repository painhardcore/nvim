local nnoremap = require("painhardcore.keymap").nnoremap

-- 
nnoremap("<leader>pv","<cmd>Ex<Cr>")

-- telescope search
nnoremap("<Leader>ff", function()
require('telescope.builtin').find_files()
end)

nnoremap("<Leader>fg", function()
require('telescope.builtin').live_grep()
end)
nnoremap("<Leader>fb", function()
require('telescope.builtin').buffers()
end)

-- buffers

nnoremap("]b", "<cmd>BufferLineCycleNext<CR>", { silent = true })
nnoremap("[b", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
nnoremap("<Leader>bp", "<cmd>BufferLinePick<CR>", { silent = true })
nnoremap("<Leader>bc", "<cmd>BufferLinePickClose<CR>", { silent = true })
nnoremap("<Leader>bd", "<cmd>bd<CR>")
