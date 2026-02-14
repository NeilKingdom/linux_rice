require("mason").setup({})
require("mason-lspconfig").setup({})

vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>")
