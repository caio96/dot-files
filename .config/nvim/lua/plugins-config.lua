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
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
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
vim.g.VM_maps = {
  ['Find Under'] = '<C-d>',
  ['Find Subword Under'] = '<C-d>'
}

-- which key
require("which-key").setup()
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- indent blankline
require("indent_blankline").setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- others
require('gitsigns').setup()
require('nvim-tree').setup()
require('fidget').setup()
