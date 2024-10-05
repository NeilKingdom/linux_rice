-- Clear trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        -- Restore cursor position
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Invoke Prettier plugin for JS/TS files on buffer write
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    command = "silent !npx prettier -w %"
})

-- Compile latex files on buffer write
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    command = "silent !lltex %"
})

-- Center page on transition to insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "norm zz"
})
