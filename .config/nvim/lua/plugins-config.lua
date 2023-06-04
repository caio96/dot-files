
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = 'mix'
vim.cmd([[colorscheme gruvbox-material]])

require('lualine').setup{
  -- tabline = {
  --   lualine_a = {'buffers'},
  --   lualine_z = {'tabs'}
  -- }
}

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

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})

require('gitsigns').setup()

-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     disable = {},
--   },
--   auto_install = true,
--   ensure_installed = {
--     "c",
--     "lua",
--     "vim",
--     "vimdoc",
--     "query",
--     "bash",
--     "cmake",
--     "cpp",
--     "dockerfile",
--     "json",
--     "llvm",
--     "make",
--     "markdown",
--     "python",
--     "tablegen",
--     "yaml"
--   },
-- }
