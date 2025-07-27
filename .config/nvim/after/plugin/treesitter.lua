require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "rust",
        "java",
        "javascript",
        "typescript",
        "python",
        "markdown",
        "markdown_inline",
        "latex",
        "html",
        "css"
    },
    -- Auto-install updates (only applied to 'ensure_installed')
    sync_install = false,
    -- Automatically request permission to install missing parsers when entering buffer
    auto_install = true,
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
