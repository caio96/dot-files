return {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    opts = {
      ensure_installed = {
        -- lsp
        "bash-language-server",
        "cmake-language-server",
        "clangd",
        "copilot-language-server",
        "dockerfile-language-server",
        "lua-language-server",
        "python-lsp-server",
        -- formatter
        "shfmt",
        "black",
        "clang-format",
        "cmakelang",
        "isort",
        "prettier",
        "shellcheck",
        "stylua",
      },
      auto_update = false,
      run_on_start = false,
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
          c = { "clang-format" },
          cmake = { "cmake_format" },
          cpp = { "clang-format" },
          go = { "gofmt" },
          json = { "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          mojo = { "mojo_format" },
          python = { "isort", "black" },
          sh = { "shfmt", "shellcheck" },
          yaml = { "prettier" },
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
        "aaronhallaert/advanced-git-search.nvim",
      },
    },
    opts = {
      extensions_list = { "fzf", "undo", "advanced_git_search" },
    },
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
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    },
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
    "NeogitOrg/neogit",
    ft = { "diff" },
    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      dofile(vim.g.base46_cache .. "neogit")
      require("neogit").setup()
    end,
  },

  {
    "tpope/vim-sleuth",
    event = "BufReadPost",
  },

  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
      require("telescope").load_extension "advanced_git_search"
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
      "sindrets/diffview.nvim",
    },
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
    "hedyhli/outline.nvim",
    cmd = { "Outline" },
    opts = {},
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    cond = function()
      -- Disable when this env var is present
      return not vim.env.DISABLE_AUTOSESSION
    end,
    opts = {
      log_level = "error",
      session_lens = {
        load_on_setup = false,
      },
      suppressed_dirs = { "~/", "~/Downloads", "/" },
    },
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "BufEnter",
    config = function()
      local mc = require "multicursor-nvim"
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "x" }, "<C-up>", function()
        mc.lineAddCursor(-1)
      end)
      set({ "n", "x" }, "<C-down>", function()
        mc.lineAddCursor(1)
      end)

      -- Add a new cursor by matching word/selection
      set({ "n", "x" }, "<C-n>", function()
        mc.matchAddCursor(1)
      end)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      -- set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    cmd = "Oil",
  },

  {
    "folke/sidekick.nvim",
    event = "BufWinEnter",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<leader>an",
        function()
          require("sidekick").nes_jump_or_apply()
        end,
        expr = true,
        desc = "Sidekick Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select { filter = { installed = true } }
        end,
        desc = "Sidekick Select Installed CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Sidekick Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send { msg = "{this}" }
        end,
        mode = { "x", "n" },
        desc = "Sidekick Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send { msg = "{file}" }
        end,
        desc = "Sidekick Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send { msg = "{selection}" }
        end,
        mode = { "x" },
        desc = "Sidekick Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
