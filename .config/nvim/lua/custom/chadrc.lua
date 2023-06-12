---@type ChadrcConfig
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
