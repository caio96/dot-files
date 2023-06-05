return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp, autocompletion and snippets plugins
  use {
    'williamboman/mason.nvim',
    run = ':MasonUpdate'
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'L3MON4D3/LuaSnip', tag = '*' }
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/nvim-cmp'

  -- Neovim plugins
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'sainnhe/gruvbox-material'
  use 'RRethy/vim-illuminate'
  use 'nvim-tree/nvim-tree.lua'
  use 'j-hui/fidget.nvim'
  use 'folke/which-key.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', tag = '*' }
  use {
    'nvim-telescope/telescope.nvim', tag = '*',
    requires = 'nvim-lua/plenary.nvim'
  }
  use  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }
  use { 
    'akinsho/bufferline.nvim', tag = '*', 
    requires = 'nvim-tree/nvim-web-devicons' 
  }
  use {
    'nvim-treesitter/nvim-treesitter', tag = '*',
    run = ':TSUpdate'
  }

  -- Vim plugins
  use 'lambdalisue/suda.vim'
  use 'preservim/nerdcommenter'
  use 'sheerun/vim-polyglot'
  use 'ntpeters/vim-better-whitespace'
  use 'mg979/vim-visual-multi'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-fugitive'

end)
