local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

-- Find file
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- Find file (git files only)
vim.keymap.set("n", "<leader>gff", builtin.git_files, {})
-- Find references to the current symbol
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
-- Live grep
vim.keymap.set("n", "<leader>gr", function()
    builtin.live_grep({ cwd = utils.buffer_dir(), grep_open_files = true })
end, {})
