require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        -- vim mode (insert, normal, visual, command)
        lualine_a = { "mode" },
        -- Git branch + diff info
        lualine_b = { "branch", "diff", "diagnostics" },
        -- File name
        lualine_c = { "filename" },
        -- Encoding, file format, extension
        lualine_x = {
            "encoding",
            {
                "fileformat",
                symbols = {
                    unix = "unix 🐧",
                    dos = "dos 🪟",
                    mac = "mac 🍎"
                }
            },
            {
                "filetype",
                icon = { align = "right" }
            }
        },
        -- Location of cursor relative to start of file (as a percentage)
        lualine_y = { "progress" },
        -- Line#:Character#
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
