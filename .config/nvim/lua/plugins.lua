-- Plugins managed by packer

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'

  use {
    'nvim-telescope/telescope.nvim', tag = '*',
    requires = 'nvim-lua/plenary.nvim'
  }

  use { 'lewis6991/gitsigns.nvim', tag = '*' }

  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }

  use 'scrooloose/nerdcommenter'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'sainnhe/gruvbox-material'
  use 'RRethy/vim-illuminate'
  
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

end)
