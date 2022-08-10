require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"bash",
--		"cpp",
		"css",
		"go",
		"html",
		"lua",
		"make",
--		"python",
--		"rust",
--		"tsx",
		"typescript",
		"yaml",
	},
	highlight = { enable = true },
}
