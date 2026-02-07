local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

-- Find file
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- Live grep
vim.keymap.set("n", "<leader>gr", function()
    builtin.live_grep({ cwd = utils.buffer_dir(), grep_open_files = true })
end, {})
