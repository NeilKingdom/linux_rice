-- Neovim key remaps

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
-- TODO: Add vim remaps
vim.keymap.set("n", "<leader>sh", ":!clear<CR>:!shellcheck %<CR>")

vim.keymap.set("n", "d-", "mm0d^i<BS><Space><ESC>`m")

