local neogen = require("neogen")

neogen.setup({
    snippet_engine = "luasnip",
    languages = {
        ["c.doxygen"] = require("neogen.configurations.cpp")
    }
})

vim.keymap.set("n", "<leader>dx", function() neogen.generate() end)
