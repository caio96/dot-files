return require('packer').startup(function(use)
  -- Packer package manager
  use 'wbthomason/packer.nvim'

  -- Lsp support
  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  
  -- Snippets
  use { 'L3MON4D3/LuaSnip', tag = '*' }
  use "rafamadriz/friendly-snippets"
  
  -- Completion support
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'

  -- Color scheme
  use 'sainnhe/gruvbox-material'
  -- Pretty icons
  use 'nvim-tree/nvim-web-devicons'
  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- Give indentation signs in files
  use 'lukas-reineke/indent-blankline.nvim'
  -- Highlights current word occurences
  use 'RRethy/vim-illuminate'
  -- File tree sidebar
  use 'nvim-tree/nvim-tree.lua'
  -- Open file at the last cursor position
  use 'ethanholz/nvim-lastplace'
  -- Progress indicator for lsp tasks
  use 'j-hui/fidget.nvim'
  -- Preview what a shortcut does
  use 'folke/which-key.nvim'
  -- Show small scroll bar for context
  use 'petertriho/nvim-scrollbar'
  -- Enable sudo writing 
  use 'lambdalisue/suda.vim'
  -- Add comments
  use 'preservim/nerdcommenter'
  -- Extra language support
  use 'sheerun/vim-polyglot'
  -- Trim and highlight whitespaces
  use 'ntpeters/vim-better-whitespace'
  -- Multiple cursors
  use 'mg979/vim-visual-multi'
  -- Detect indentation
  use 'tpope/vim-sleuth'
  -- Git related
  use 'tpope/vim-fugitive'
  -- Wiki notes support
  use 'vimwiki/vimwiki'
  -- Shows git changes in files
  use { 'lewis6991/gitsigns.nvim', tag = '*' }
  -- Fuzzy finder and pretty preview
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = 'nvim-lua/plenary.nvim' }
  -- FZF fuzzy finder support for telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Shows tabs status line
  use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' }
  -- AST based highlighting and other functions
  use { 'nvim-treesitter/nvim-treesitter', tag = '*', run = ':TSUpdate' }
  -- AST based movements
  use 'nvim-treesitter/nvim-treesitter-textobjects'

end)
