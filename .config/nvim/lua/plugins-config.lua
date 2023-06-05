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
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})

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

-- others
require('gitsigns').setup()
require('nvim-tree').setup()
