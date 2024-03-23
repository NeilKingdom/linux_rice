require('nvim-treesitter.configs').setup({
    ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "rust" },
    -- Auto-install updates (only applied to 'ensure_installed')
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
