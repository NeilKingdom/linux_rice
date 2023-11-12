-- Plugins are managed using Packer in my case. Run :PackerSync to install new plugins or update old ones

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
   -- The Packer plugin (manages itself)
   use "wbthomason/packer.nvim"

   -- Telescope for file/word search
   use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"}
   }

   -- Tokyonight colorscheme
   use("folke/tokyonight.nvim")

   -- Lualine status bar
   use({
     'nvim-lualine/lualine.nvim',
     requires = {'nvim-tree/nvim-web-devicons', opt = true}
   })

   -- Treesitter for syntax highlighting
   use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

   -- Allows us to see the treesitter lexical analyser
   use("nvim-treesitter/playground")

   -- The Primeagen's Harpoon plugin for quick file switching
   use("theprimeagen/harpoon")

   -- Undotree for managing file changes
   use("mbbill/undotree")

   -- Fugitive for running Git commands natively in nvim
   use("tpope/vim-fugitive")

   -- LSP Zero for LSP support
   use {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v1.x",
      requires = {
         -- LSP Support
         {"neovim/nvim-lspconfig"},
         -- Mason for managing language servers
         {"williamboman/mason.nvim"},
         {"williamboman/mason-lspconfig.nvim"},

         -- Autocompletion
         {"hrsh7th/nvim-cmp"},
         {"hrsh7th/cmp-nvim-lsp"},
         {"hrsh7th/cmp-buffer"},
         {"hrsh7th/cmp-path"},
         {"saadparwaiz1/cmp_luasnip"},
         {"hrsh7th/cmp-nvim-lua"},

         -- Snippets
         {"L3MON4D3/LuaSnip"},
         {"rafamadriz/friendly-snippets"},
      }
   }
end)
