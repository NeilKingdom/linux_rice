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
        format = function(_, item)
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
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})
