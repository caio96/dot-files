require "nvchad.options"

-- Show whitespace characters
vim.opt.showbreak = "󱞩"
vim.opt.list = true
vim.opt.listchars = {
  tab = "› ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "⣿",
  eol = "¬",
}

-- Show last line as much as possible
vim.opt.display:append "lastline"

-- Always show space ahead when scrolling down or sideways
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5

-- Update session options for auto-sessions
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
