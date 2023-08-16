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
      {
        "utilyre/barbecue.nvim",
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
    event = "BufWinEnter",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.indent_blankline,
  },

  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    config = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("highlight Headline1 guifg=%s gui=bold", colors.pink))
      vim.cmd(string.format("highlight Headline2 guifg=%s gui=bold", colors.yellow))
      vim.cmd(string.format("highlight Headline3 guifg=%s gui=bold", colors.blue))
      vim.cmd(string.format("highlight Headline4 guifg=%s gui=bold", colors.orange))
      vim.cmd(string.format("highlight Headline5 guifg=%s gui=bold", colors.red))
      require('headlines').setup {
        markdown = {
          headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5" },
          codeblock_highlight = false,
          fat_headline = false,
          fat_headline_upper_string = "",
          fat_headline_lower_string = "",
        },
      }
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("hi IlluminatedWordRead gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordText gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordWrite gui=none guibg=%s", colors.one_bg))
      require("illuminate").configure {
        under_cursor = false,
      }
    end,
    cond = function ()
      -- Disable for files without a file type
      if not vim.bo.filetype then
        return false
      end
      -- Disable for large files
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
      if ok and stats and stats.size > 1000000 then
        return false
      end
      return true
    end,
  },

  {
    "lewis6991/spaceless.nvim",
    event = "VeryLazy",
    config = true,
    cond = function ()
      return vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "diff"
    end
  },

  {
    'echasnovski/mini.map',
    lazy = false,
    version = '*',
    config = function ()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.gitsigns(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot('4x2'),
          scroll_line = '█ ',
        },
        window = {
          show_integration_count = false,
          winblend = 20
        },
      })

      -- Open minimap automatically
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          require('mini.map').open()
        end,
        pattern = "*",
      })
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
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      mapping = {"jk", "JK"},
    }
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle"
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          -- Removing ; and , from the defaults
          keys = { "f", "F", "t", "T" },
        },
        search = {
          enabled = false,
        }
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function ()
      require('hlslens').setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "never",
      })
      local kopts = {noremap = true, silent = true}
      vim.api.nvim_set_keymap('n', 'n',
          [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap('n', 'N',
          [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
    end
  },

  {
    "folke/trouble.nvim",
    cmd = {"Trouble", "TroubleToggle"},
    config = true,
  },

  {
    'tzachar/highlight-undo.nvim',
    keys = {"u", "<C-r>"},
    config = true,
  },

  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    opts = {},
  },

  {
    'sindrets/diffview.nvim',
    cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh"}
  },

  {
    'NeogitOrg/neogit',
    cmd = {"Neogit"},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function ()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("highlight def NeogitDiffAdd             guifg=%s", colors.green))
      vim.cmd(string.format("highlight def NeogitDiffAddHighlight    guifg=%s", colors.green))
      vim.cmd(string.format("highlight def NeogitDiffDelete          guifg=%s", colors.red))
      vim.cmd(string.format("highlight def NeogitDiffDeleteHighlight guifg=%s", colors.red))
      vim.cmd(string.format("highlight def NeogitHunkHeader          guibg=%s guifg=%s", colors.grey, colors.black))
      vim.cmd(string.format("highlight def NeogitHunkHeaderHighlight guibg=%s guifg=%s", colors.light_grey, colors.black))

      require("neogit").setup ({
        use_telescope = true,
      })
    end
  },

  {
    "lambdalisue/suda.vim",
    cmd = {"SudaRead", "SudaWrite"},
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = {"SymbolsOutline"},
    opts = {},
  },

  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/"},
    },
    dependencies = {
      {
        'rmagatti/session-lens',
        opts = {},
        config = function()
          require("telescope").load_extension("session-lens")
        end
      },
    }
  },

  {
    "svermeulen/vim-cutlass",
    event = "VeryLazy",
  },

  {
    "ibhagwan/smartyank.nvim",
    event = "VeryLazy",
    opts = {
      highlight = {
        timeout = 200,
      },
      clipboard = {
        enabled = true,
      },
      tmux = {
        enabled = true,
      },
      osc52 = {
        enabled = true,
        escseq = 'tmux',
        silent = true,
      },
    },
  },

  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ensure_installed = {"c", "cpp"}
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    }
  },

  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },

  -- To use a extras plugin
  -- { import = "custom.configs.extras.mason-extras", },
}

return plugins
