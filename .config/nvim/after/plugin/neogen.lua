local neogen = require("neogen")
local i = require("neogen.types.template").item

cpp_doxycomment = {
    -- Annotation for files
    { nil, "/**", { no_results = true, type = { "file" } } },
    { nil, " * @file " .. vim.fn.expand("%:t"), { no_results = true, type = { "file" } } },
    { nil, " * @author $1", { no_results = true, type = { "file" } } },
    { nil, " * @since $1", { no_results = true, type = { "file" } } },
    { nil, " * @version $1", { no_results = true, type = { "file" } } },
    { nil, " * @brief $1", { no_results = true, type = { "file" } } },
    { nil, " */", { no_results = true, type = { "file" } } },
    -- Annotation for functions
    { nil,         "/**", { type = { "func" } } },
    { nil,         " * @brief $1", { type = { "func" } } },
    { nil,         " * @since " .. os.date("%d-%m-%Y"), { type = { "func" } } },
    { i.Parameter, " * @param %s $1" },
    { i.Return,    " * @returns $1" },
    { nil,         " */", { type = { "func" } } },
}

neogen.setup({
    snippet_engine = "luasnip",
    languages = {
        c = {
            template = {
                annotation_convention = "doxygen",
                doxygen = cpp_doxycomment
            }
        },
        cpp = {
            template = {
                annotation_convention = "doxygen",
                doxygen = cpp_doxycomment
            }
        },
    }
})

vim.keymap.set("n", "<leader>dx", function() neogen.generate() end)
