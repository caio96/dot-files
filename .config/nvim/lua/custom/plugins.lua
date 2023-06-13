local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.indent_blankline,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = overrides.gitsigns.dependencies,
  },

  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {
      markdown = {
        headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5" },
        codeblock_highlight = false,
        fat_headline = false,
        fat_headline_upper_string = "",
        fat_headline_lower_string = "",
      },
    },
    init = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("highlight Headline1 guifg=%s gui=bold", colors.pink))
      vim.cmd(string.format("highlight Headline2 guifg=%s gui=bold", colors.orange))
      vim.cmd(string.format("highlight Headline3 guifg=%s gui=bold", colors.blue))
      vim.cmd(string.format("highlight Headline4 guifg=%s gui=bold", colors.yellow))
      vim.cmd(string.format("highlight Headline5 guifg=%s gui=bold", colors.red))
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("hi IlluminatedWordRead gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordText gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordWrite gui=none guibg=%s", colors.one_bg))
      require("illuminate").configure {
        under_cursor = false,
      }
    end,
  },

  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function()
      vim.g.better_whitespace_ctermcolor = "None"
      vim.g.better_whitespace_guicolor = "None"
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.strip_only_modified_lines = 1
      vim.g.strip_max_file_size = 0
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Telekasten",
    opts = {
      home = vim.fn.expand "~/.zettelkasten",
      command_palette_theme = 'dropdown',
      auto_set_filetype = false,
    },
  },

  {
    "folke/trouble.nvim",
    cmd = {"Trouble", "TroubleToggle"},
    config = true,
  },

  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    opts = {},
  },

  {
    "lambdalisue/suda.vim",
    cmd = {"SudaRead", "SudaWrite"},
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  -- To use a extras plugin
  -- { import = "custom.configs.extras.mason-extras", },
}

return plugins
