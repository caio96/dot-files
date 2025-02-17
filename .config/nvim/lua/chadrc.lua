-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvchad",

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },

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

return M
