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
    command = "silent !latexmk %"
})

-- Cleanup latex files on close
vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*.tex",
    command = "silent !latexmk -c && rm -rf *.listing _minted"
})

-- Center page on transition to insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "norm zz"
})

-- LSP binds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        -- Jump to definition
        vim.keymap.set("n", "<leader>jd", vim.lsp.buf.definition, opts)

        -- Jump to declaration
        vim.keymap.set("n", "<leader>jD", vim.lsp.buf.declaration, opts)

        -- Hover docs
        vim.keymap.set("n", "<leader>fh", vim.lsp.buf.hover, opts)

        -- Signature help
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)

        -- Rename symbol
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Find references to the current symbol
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts)

        -- Diagnostics
        vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
    end
})
