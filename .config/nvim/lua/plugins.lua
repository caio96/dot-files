-- Plugins managed by packer

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lsp plugins
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'

  --use {
    --'nvim-telescope/telescope.nvim', tag = '*',
    --requires = 'nvim-lua/plenary.nvim'
  --}

  use {
    'akinsho/bufferline.nvim', tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use 'scrooloose/nerdcommenter'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'ellisonleao/gruvbox.nvim'
end)
