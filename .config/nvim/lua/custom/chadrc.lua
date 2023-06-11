---@type ChadrcConfig

-- Remap leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

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

local M = {}
M.ui = {
  theme = "pastelbeans",

  statusline = {
    separator_style = {
      ["right"] = "█",
      ["left"] = "",
    },
  },

  tabufline = {
    lazyload = false,
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
