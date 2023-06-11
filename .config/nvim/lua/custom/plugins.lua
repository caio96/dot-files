local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.0",
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "cmake",
        "cpp",
        "dockerfile",
        "json",
        "llvm",
        "markdown",
        "markdown_inline",
        "make",
        "python",
        "tablegen",
        "yaml",
      },
      highlight = {
        additional_vim_regex_highlighting = false,
      },
    },
  },

  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {
      markdown = {
        headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5" },
        fat_headline = false,
        fat_headline_upper_string = "",
        fat_headline_lower_string = "",
      },
    },
    config = function()
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
    "ethanholz/nvim-lastplace",
    lazy = false,
    opts = {},
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
    "lambdalisue/suda.vim",
    lazy = false,
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

  -- {
  --   "vimwiki/vimwiki",
  --   lazy = false,
  --   init = function()
  --     vim.g.vimwiki_ext2syntax = {['.wiki'] = 'markdown'}
  --     -- Headers with different colors
  --     vim.g.vimwiki_hl_headers = 1
  --     -- Highligh checked [X]
  --     vim.g.vimwiki_hl_cb_checked = 1
  --     -- Add syntax highlight
  --     local wiki = { path = '~/.vimwiki',
  --                    nested_syntaxes = {python='py', cpp='cpp', sh='sh'},
  --                    syntax = 'markdown',
  --                    ext = '.md',
  --     }
  --     vim.g.vimwiki_list = {wiki}
  --   end,
  -- },

  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    opts = {
      home = vim.fn.expand "~/.zettelkasten",
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context_start = false,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lsp
        "bash-language-server",
        "cmake-language-server",
        "clangd",
        "dockerfile-language-server",
        "python-lsp-server",
        -- linter
        "cmakelint",
        "hadolint",
        "markdownlint",
        "shellcheck",
        -- formatter
        "beautysh",
        "black",
        "prettier",
        "stylua",
        "isort",
        "",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
