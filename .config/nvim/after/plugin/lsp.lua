local lsp_zero = require("lsp-zero")

-- Executes when lsp is attached to buffer

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Jump to definition
    vim.keymap.set("n", "<leader>jd", function() vim.lsp.buf.definition() end, opts)
    -- Function/variable help
    vim.keymap.set("n", "<leader>fh", function() vim.lsp.buf.hover() end, opts)
    -- A less useful version of hover()
    vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
    -- Rename function/variable
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    -- Find usages of the current symbol
    vim.keymap.set("n", "<leader>fu", function() vim.lsp.buf.references() end, opts)
    -- Find symbols at the workspace level e.g. structs or classes
    vim.keymap.set("n", "<leader>fwr", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- Trigger a specified action at the current cursor position
    --vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

    -- Open warning/error message in a floating window
    vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
    -- Jump to next warning/error message
    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
    -- Jump to previous warning/error message
    vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
end)

-- Manage language servers for Mason

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "rust_analyzer"
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
        clangd = function()
            require("lspconfig").clangd.setup({
                cmd = {
                    "clangd",
                    "--function-arg-placeholders",
                    "--header-insertion=never",
                    "--header-insertion-decorators"
                }
            })
        end
    }
})

-- nvim-cmp for autocompletion

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    -- Where suggestions come from
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
    },
    formatting = {
        -- Kind: Type, Abbr: Desc, Menu: Nothing
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
        --["<C-S-k>"] = cmp.mapping.scroll_docs(-1),
        --["<C-S-j>"] = cmp.mapping.scroll_docs(1),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Open the autocomplete window
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    window = {
        -- The Autocomplete window
        completion = {
            zindex = 100
        },
        -- The API documentation window
        documentation = {
            zindex = 200
        }
    }
})
