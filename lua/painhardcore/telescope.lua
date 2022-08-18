local t = require "telescope"
t.setup {
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "insert",
		hidden = true,
		file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
	},
	extensions = { file_browser = { hidden = true } },
}
t.load_extension "file_browser"
t.load_extension 'fzf'
t.load_extension 'git_worktree'
