vim.opt.number = true
vim.opt.signcolumn = 'yes'

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.showmatch = true

vim.opt.showbreak = '﬌'
vim.opt.list = true
vim.opt.listchars = {
  tab = '› ',
  trail = '·',
  extends = '»',
  precedes = '«',
  nbsp = '⣿',
  eol = '¬'
}

vim.opt.whichwrap:append{
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  ['h'] = true,
  ['l'] = true
}

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard:append('unnamedplus')

vim.opt.completeopt:remove('preview')
vim.opt.display:append('lastline')

vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5

vim.opt.termguicolors = true