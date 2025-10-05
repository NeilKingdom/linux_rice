-- Plugins are managed using Packer
--
-- PackerSync:          Synchronize packages with upstream repos
-- PackerUpdate:        Update packages to the latest version available
-- PackerInstall:       Install a package
-- PackerClean:         Cleans up installed plugins which are not referenced in this file
-- PackerCompile:       Compile packer settings
-- PackerStatus: 	    Show list of installed plugins

-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- The Packer plugin (manages itself)
    use("wbthomason/packer.nvim")

    -- Common dependency
    use("nvim-lua/plenary.nvim")

    -- Telescope for file search/explorer
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    })

    -- Tokyonight colorscheme
    use("folke/tokyonight.nvim")

    -- Lualine status bar
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
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
        requires = { "nvim-lua/plenary.nvim" }
    })

    -- Neogen for generating doxygen comments
    use("danymat/neogen")

    -- Undotree for managing file history
    use("mbbill/undotree")

    -- Fugitive for running git commands natively in nvim
    use("tpope/vim-fugitive")

    -- Render-Markdown for rendering markdown inline
    use({
        "MeanderingProgrammer/render-markdown.nvim",
        after = { "nvim-treesitter" },
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
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
