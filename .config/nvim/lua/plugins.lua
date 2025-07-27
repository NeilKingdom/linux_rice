-- Plugins are managed using Packer
--
-- PackerSync:          Synchronize packages with upstream repos
-- PackerUpdate:        Update packages to the latest version available
-- PackerInstall:       Install a package
-- PackerClean:         Cleans up installed plugins which are not referenced in this file
-- PackerCompile:       Compile packer settings

-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- The Packer plugin (manages itself)
    use("wbthomason/packer.nvim")

    -- Telescope for file search/explorer
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

    -- Harpoon for quick file navigation
    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    })

    -- Neogen for generating annotations
    use("danymat/neogen")

    -- Undotree for managing file history
    use("mbbill/undotree")

    -- Fugitive for running git commands natively in nvim
    use("tpope/vim-fugitive")

    -- Render-Markdown for rendering markdown inline
    use({
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter" },
        config = function()
            require("render-markdown").setup({})
        end,
    })

    -- LSP-Zero for LSP support
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- Mason for managing language servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",

            -- Autocompletion via nvim-cmp + autocomplete sources
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets"
        }
    })
end)
