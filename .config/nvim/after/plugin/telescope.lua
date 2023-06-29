local builtin = require("telescope.builtin")

-- File search
vim.keymap.set("n", "<leader>fs", builtin.find_files, {})
-- Git file search
vim.keymap.set("n", "<leader>gfs", builtin.git_files, {})
-- Word search (requires ripgrep to be installed)
vim.keymap.set("n", "<leader>ws", function()
	builtin.grep_string({ search = vim.fn.input("Word search: ") })
end)
