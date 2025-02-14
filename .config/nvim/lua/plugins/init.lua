return {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require "nvchad.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
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
        "lua-language-server",
        "python-lsp-server",
        "shellcheck",
        -- formatter
        "beautysh",
        "black",
        "clang-format",
        "cmakelang",
        "isort",
        "prettier",
        "shellcheck",
        "stylua",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
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
        "gitcommit",
        "git_rebase",
        "html",
        "json",
        "llvm",
        "markdown",
        "markdown_inline",
        "make",
        "python",
        "tablegen",
        "yaml",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    config = function()
      local options = {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          sh = { "beautysh", "shellcheck" },
          c = { "clang-format" },
          cmake = { "cmake_format" },
          cpp = { "clang-format" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
      }

      require("conform").setup(options)
      require("conform").formatters.stylua = {
        prepend_args = { "--indent-type", "Spaces" },
      }
      require("conform").formatters.beautysh = {
        prepend_args = { "--indent-size", "2" },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { show_start = false },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = { custom = { "^.git$" } },
      view = { adaptive_size = true },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "debugloop/telescope-undo.nvim",
      },
    },
    opts = {
      extensions_list = { "fzf", "undo" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {},
  },

  {
    "utilyre/barbecue.nvim",
    version = "*",
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
  },

  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = "nvim-treesitter",
    config = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("hi IlluminatedWordRead gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordText gui=none guibg=%s", colors.one_bg))
      vim.cmd(string.format("hi IlluminatedWordWrite gui=none guibg=%s", colors.one_bg))

      require("illuminate").configure {
        under_cursor = false,
        large_file_cutoff = 100000,
        min_count_to_highlight = 2,
        filetypes_denylist = {
          "NvimTree",
          "Trouble",
          "Outline",
          "TelescopePrompt",
          "Empty",
          "dirvish",
          "fugitive",
          "alpha",
          "packer",
          "neogitstatus",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "aerial",
        },
      }
    end,
    cond = function()
      -- Disable for files without a file type
      if not vim.bo.filetype then
        return false
      end
      return true
    end,
  },

  {
    "lewis6991/spaceless.nvim",
    event = "InsertEnter",
    config = true,
    cond = function()
      return vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "diff"
    end,
  },

  -- {
  --   "axelf4/vim-strip-trailing-whitespace",
  --   event = "BufReadPost",
  --   cmd = "StripTrailingWhitespace",
  --   config = function() end,
  --   cond = function()
  --     return vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "diff"
  --   end,
  -- },

  {
    "echasnovski/mini.map",
    event = "BufEnter",
    version = "*",
    config = function()
      local map = require "mini.map"
      map.setup {
        integrations = {
          map.gen_integration.gitsigns(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot "4x2",
          scroll_line = "█ ",
        },
        window = {
          width = 10,
          show_integration_count = false,
          winblend = 0,
        },
      }

      -- Open minimap automatically
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          require("mini.map").open()
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
      command_palette_theme = "dropdown",
      auto_set_filetype = false,
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      default_mappings = true,
      mappings = {
          i = {
              j = {
                  -- These can all also be functions
                  k = "<Esc>",
              },
          },
          c = {
              j = {
                  k = "<Esc>",
              },
          },
          t = {
              j = {
                  k = "<C-\\><C-n>",
              },
          },
          v = {
              j = {
                  k = "<Esc>",
              },
          },
          s = {
              j = {
                  k = "<Esc>",
              },
          },
      },
    },
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
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
        },
      },
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
    event = "BufReadPost",
    config = function()
      require("hlslens").setup {
        calm_down = true,
        nearest_only = true,
        nearest_float_when = "never",
      }
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap(
        "n",
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = true,
  },

  {
    "tzachar/highlight-undo.nvim",
    keys = { "u", "<C-r>" },
    config = true,
  },

  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    opts = {},
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
  },

  {
    "NeogitOrg/neogit",
    ft = { "diff" },
    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local colors = require("base46").get_theme_tb "base_30"
      vim.cmd(string.format("highlight def NeogitDiffAdd             guifg=%s", colors.green))
      vim.cmd(string.format("highlight def NeogitDiffAddHighlight    guifg=%s", colors.green))
      vim.cmd(string.format("highlight def NeogitDiffDelete          guifg=%s", colors.red))
      vim.cmd(string.format("highlight def NeogitDiffDeleteHighlight guifg=%s", colors.red))
      vim.cmd(string.format("highlight def NeogitHunkHeader          guibg=%s guifg=%s", colors.grey, colors.black))
      vim.cmd(
        string.format("highlight def NeogitHunkHeaderHighlight guibg=%s guifg=%s", colors.light_grey, colors.black)
      )
      require("neogit").setup()
    end,
  },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },

  {
    "gbprod/cutlass.nvim",
    event = "BufReadPost",
    opts = {
      cut_key = "m",
      exclude = { "ns", "nS" },
    },
  },

  {
    "ibhagwan/smartyank.nvim",
    event = "BufReadPost",
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
        escseq = "tmux",
        silent = true,
      },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    opts = {},
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
      require("headlines").setup {
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
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      session_lens = {
        load_on_setup = false,
      },
      pre_save_cmds = { "NvimTreeClose" },
    },
  },

  {
    "mg979/vim-visual-multi",
    event = "BufEnter",
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    cmd = "Oil",
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = { "gcc", "gbc", { "gc", "gb", mode = "v" } },
  },

  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
    },
    dependencies = {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
        -- Insert new source to nvim cmp
        local cmp = require "cmp"
        local config = cmp.get_config()
        table.insert(config.sources, {
          name = "copilot",
        })
        cmp.setup(config)
      end,
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatDebugInfo",
    },
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {},
  },
}
