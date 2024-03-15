local builtin = require("telescope.builtin")

-- File search
vim.keymap.set("n", "<leader>fs", builtin.find_files, {})
-- Git file search
vim.keymap.set("n", "<leader>gfs", builtin.git_files, {})
-- Fuzzy finder
vim.keymap.set("n", "<leader>ff", function()
    builtin.grep_string({ search = vim.fn.input("Find: ") });
end)
