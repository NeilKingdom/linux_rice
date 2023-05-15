-- Neovim key remaps

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
-- TODO: Add vim remaps
vim.keymap.set("n", "<leader>sh", ":!clear<CR>:!shellcheck %<CR>")

vim.keymap.set("n", "d-", "mm0d^i<BS><Space><ESC>`m")
vim.keymap.set("n", "d_", "mm0d^i<BS><ESC>`m")

-- Copy and paste
vim.keymap.set("n", "<C-y>", "+y")
vim.keymap.set("n", "<C-y>", "+yy")
vim.keymap.set("n", "<C-x>", "+d")
vim.keymap.set("n", "<C-x>", "+dd")
vim.keymap.set("n", "<C-p>", "+p")
vim.keymap.set("n", "<C-p>", "<ESC>\"+p")
vim.keymap.set("n", "<C-p>", "<ESC>\"+pa")
