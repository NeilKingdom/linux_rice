local builtin = require("telescope.builtin")

-- File search
vim.keymap.set("n", "<leader>fs", builtin.find_files, {})
-- Git file search
vim.keymap.set("n", "<leader>gfs", builtin.git_files, {})
