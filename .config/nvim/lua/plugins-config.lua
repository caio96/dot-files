-- gruvbox-material
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = 'mix'
vim.cmd([[colorscheme gruvbox-material]])

-- lualine
require('lualine').setup{
  -- tabline = {
  --   lualine_a = {'buffers'},
  --   lualine_z = {'tabs'}
  -- }
}

-- bufferline
local bufferline = require('bufferline')
bufferline.setup {
  options = {
    style_preset = {
        bufferline.style_preset.no_italic,
        bufferline.style_preset.no_bold
    },
    separator_style = 'slant'
  }
}

-- telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
require('telescope').load_extension('fzf')
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', telescope.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<C-p>',      telescope.find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>gf', telescope.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<M-space>',
    },
  },
  additional_vim_regex_highlighting = false,
  auto_install = true,
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
    "make",
    "markdown",
    "python",
    "tablegen",
    "yaml"
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

-- nerdcommenter
vim.g.NERDCreateDefaultMappings = 0
vim.keymap.set({'n', 'v'}, '<leader>cc', '<cmd> call nerdcommenter#Comment(0,"toggle")<CR>')

-- nvim tree
vim.keymap.set('', '<F2>', '<cmd> NvimTreeToggle<CR>')

-- vim better whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.strip_only_modified_lines = 1
vim.g.strip_max_file_size = 0

-- vim visual multi
-- vim.g.VM_maps = {
--   ['Find Under'] = '<C-d>',
--   ['Find Subword Under'] = '<C-d>'
-- }

-- which key
require("which-key").setup()
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- indent blankline
require("indent_blankline").setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- vim illuminate
vim.keymap.set('n', '<leader>nr', require('illuminate').goto_next_reference, { desc = "Move to [n]ext illuminated [r]eference" })
vim.keymap.set('n', '<leader>pr', require('illuminate').goto_prev_reference, { desc = "Move to [p]revious illuminated [r]eference" })

-- vimwiki
-- Use markdown syntax
vim.g.vimwiki_ext2syntax = {['.wiki'] = 'markdown'}
-- Headers with different colors
vim.g.vimwiki_hl_headers = 1
-- Highligh checked [X]
vim.g.vimwiki_hl_cb_checked = 1
-- Add syntax highlight
local wiki = { path = '~/.vimwiki',
               nested_syntaxes = {python='py', cpp='cpp', sh='sh'} }
vim.g.vimwiki_list = {wiki}

-- others
require('gitsigns').setup()
require('nvim-tree').setup()
require('fidget').setup()
require('nvim-lastplace').setup()
require("scrollbar").setup()
require("scrollbar.handlers.gitsigns").setup()
