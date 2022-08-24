local t = require "telescope"
t.setup {
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "insert",
		hidden = false,
    path_display = {"smart"},
		file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
    layout_config={ width=0.99},
	},
	extensions = { file_browser = { hidden = true } },
}
t.load_extension "file_browser"
t.load_extension 'fzf'
t.load_extension 'git_worktree'
