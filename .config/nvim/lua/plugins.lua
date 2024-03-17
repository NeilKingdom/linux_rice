-- Plugins are managed using Packer in my case
-- :PackerSync - Synchronize packages with upstream repos
-- :PackerUpdate - Update packages to the latest version available
-- :PackerInstall - Install a package
-- :PackerUninstall - Uninstall a package
-- :PackerCompile - Compile packer settings

-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

local packer = require("packer")
packer.util = require("packer.util")

return packer.startup(function(use)
    -- The Packer plugin (manages itself)
    use("wbthomason/packer.nvim")

    -- Telescope for file/word search
    use({
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    })

    -- Tokyonight colorscheme
    use("folke/tokyonight.nvim")

    -- Lualine status bar
    use({
        "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    })

    -- Treesitter for syntax highlighting and semantic analysis
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })

    -- Allows us to see the treesitter lexical analyser (AST/CST)
    use("nvim-treesitter/playground")

    -- The Primeagen's Harpoon plugin for quick file switching
    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    })

    -- Neogen for auto documentation
    use("danymat/neogen")

    -- Undotree for managing file changes
    use("mbbill/undotree")

    -- Fugitive for running Git commands natively in nvim
    use("tpope/vim-fugitive")

    -- LSP-Zero for LSP support
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            "neovim/nvim-lspconfig",

            -- Mason for managing language servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion via nvim-cmp + autocomplete sources
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets"
        }
    })
end)
