-- Neovim key remaps

vim.g.mapleader = " "
-- Open netrw
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
-- Close netrw
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>sc", ":!clear<CR>:!shellcheck %<CR>")
vim.keymap.set("n", "<leader>so", ":so<CR>")
vim.keymap.set("n", "<leader>lw", ":set wrap!<CR>:set wrap?<CR>")

-- Copy and paste

vim.keymap.set("n", "<C-y>", "+y")
vim.keymap.set("n", "<C-y>", "+yy")
vim.keymap.set("n", "<C-x>", "+d")
vim.keymap.set("n", "<C-x>", "+dd")
vim.keymap.set("n", "<C-p>", "+p")
vim.keymap.set("n", "<C-p>", "<ESC>\"+p")
vim.keymap.set("n", "<C-p>", "<ESC>\"+pa")

-- Switching windows

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resizing windows

vim.keymap.set("n", "<Up>", "5<C-w><S-+>")
vim.keymap.set("n", "<Down>", "5<C-w><S-->")
vim.keymap.set("n", "<Left>", "10<C-w><S->>")
vim.keymap.set("n", "<Right>", "10<C-w><S-<>")

-- Center page on movements

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")

-- General purpose

vim.keymap.set("n", "d-", "mm0d^i<BS><Space><ESC>`m")
vim.keymap.set("n", "d_", "mm0d^i<BS><ESC>`m")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
