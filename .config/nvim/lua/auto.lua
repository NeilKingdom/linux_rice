-- Detect latex files properly
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tex",
    command = "set filetype=tex"
})

-- Compile latex files on buffer write
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    command = "silent! !lualatex --output-directory=~/.local/share/latex/output %"
})

-- Center page on transition to insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "norm zz"
})

-- Clear trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e"
})

-- Remove '-' as a keyword separator for CSS files
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "css",
    command = "setlocal iskeyword-=-"
})

-- Remove '_' as a keyword separator for C files
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "c",
    command = "setlocal iskeyword-=_"
})
