local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

-- Executes when lsp is attached to buffer

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Jump to definition
    vim.keymap.set("n", "<leader>jd", function() vim.lsp.buf.definition() end, opts)
    -- Jump to declaration
    vim.keymap.set("n", "<leader>jD", function() vim.lsp.buf.declaration() end, opts)
    -- Function/variable help
    vim.keymap.set("n", "<leader>fh", function() vim.lsp.buf.hover() end, opts)
    -- A less useful version of hover()
    vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
    -- Rename function/variable
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    -- Open warning/error message in a floating window
    vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
    -- Jump to next warning/error message
    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
    -- Jump to previous warning/error message
    vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp_zero.setup({})

-- Mason setup

require("mason").setup({})
require("mason-lspconfig").setup({})

-- nvim-cmp for autocompletion

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    -- Where suggestions come from
    sources = {
        { name = "nvim_lsp" }, -- LSP
        { name = "nvim_lua" }, -- Lua API
        { name = "luasnip" },  -- Snippets
        { name = "buffer" },   -- Words in current buffer
        { name = "path" },     -- System path
        { name = "cmdline" },  -- CLI programs
    },
    formatting = {
        -- Specifies what fields to display in autocomplete window
        fields = { "kind", "abbr", "menu" },
        -- Set max width
        format = function(entry, item)
            local max_abbr_width = math.floor(vim.api.nvim_win_get_width(0) / 3)
            item.abbr = vim.fn.strcharpart(item.abbr, 0, max_abbr_width)
            return item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<A-k>"] = cmp.mapping.scroll_docs(-1),
        ["<A-j>"] = cmp.mapping.scroll_docs(1),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    window = {
        -- The autocomplete window
        completion = {
            zindex = 100
        },
        -- The API documentation window
        documentation = {
            zindex = 200
        }
    }
})
