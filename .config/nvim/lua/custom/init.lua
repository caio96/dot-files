-- Remap leader
-- vim.g.mapleader = "\\"
-- vim.g.maplocalleader = "\\"

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

-- Don't highlight all search occurences
vim.opt.hlsearch = false

-- Show last line as much as possible
vim.opt.display:append "lastline"

-- Always show space ahead when scrolling down or sideways
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5

vim.diagnostic.config {virtual_text = false,underline = false,}

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
