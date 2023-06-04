--Config for neovim

vim.opt.number = true
vim.opt.signcolumn = 'yes'

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.showmatch = true

vim.opt.showbreak = '﬌'
--vim.opt.listchars = {tab = '›\\', trail = '·', extends = '»', precedes = '«', nbsp = '⣿', eol = '¬'}
--vim.opt.whichwrap:append({'<','>','[',']','h','l'})

--vim.opt.undodir = "~/.vim/undo//"
--vim.opt.directory = "~/.vim/swap//"

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard:append('unnamedplus')

vim.opt.completeopt:remove('preview')
vim.opt.display:append('lastline')

vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5

vim.opt.termguicolors = true

require('plugins')

vim.cmd([[colorscheme gruvbox]])

require('lualine').setup{
  options = { theme = 'gruvbox' }
}

require("bufferline").setup{}
