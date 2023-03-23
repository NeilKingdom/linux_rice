-- Plugins are managed using Packer in my case. Run :PackerSync to install new plugins or update old ones

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- The Packer plugin (manages itself)
   use 'wbthomason/packer.nvim'

   -- Telescope for file/word search
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = {{'nvim-lua/plenary.nvim'}}
   }

   -- Rosepine color scheme
   use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
         require("rose-pine").setup()
         vim.cmd('colorscheme rose-pine')
      end
   })

   -- Treesitter for syntax highlighting
   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
   -- Allows us to see the treesitter lexical analyser
   use('nvim-treesitter/playground')
   -- The Primeagen's Harpoon plugin for quick file switching
   use('theprimeagen/harpoon')
   -- Undotree for managing file changes
   use('mbbill/undotree')
   -- Fugitive for running Git commands natively in nvim
   use('tpope/vim-fugitive')

   -- LSP Zero for LSP support
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},             -- Required
         {'williamboman/mason.nvim'},           -- Optional
         {'williamboman/mason-lspconfig.nvim'}, -- Optional

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},         -- Required
         {'hrsh7th/cmp-nvim-lsp'},     -- Required
         {'hrsh7th/cmp-buffer'},       -- Optional
         {'hrsh7th/cmp-path'},         -- Optional
         {'saadparwaiz1/cmp_luasnip'}, -- Optional
         {'hrsh7th/cmp-nvim-lua'},     -- Optional

         -- Snippets
         {'L3MON4D3/LuaSnip'},             -- Required
         {'rafamadriz/friendly-snippets'}, -- Optional
      }
   }
end)
