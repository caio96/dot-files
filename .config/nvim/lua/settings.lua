-- Map leader
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Show line numbers
vim.opt.number = true
-- Always show sign column
vim.opt.signcolumn = 'yes'

-- Default indentation
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Show matching brackets
vim.opt.showmatch = true

-- Create an undo file
vim.opt.undofile = true

-- Show whitespace characters
vim.opt.showbreak = '󱞩'
vim.opt.list = true
vim.opt.listchars = {
  tab = '› ',
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp = '⣿',
  eol = '¬'
}

-- Better movement on wrapped lines
vim.opt.whichwrap:append{
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  ['h'] = true,
  ['l'] = true
}

-- Don't highlight all search occurences
vim.opt.hlsearch = false
-- Be smart about search case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Improve look of autocomplete window
vim.opt.completeopt = {'menuone', 'noselect'}

-- Show last line as much as possible
vim.opt.display:append('lastline')

-- Always show space ahead when scrolling down or sideways
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5

-- Use nice colors
vim.opt.termguicolors = true
