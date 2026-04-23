-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvchad",

  integrations = { "neogit" },

  hl_override = {
    DiffChange = { bg = { "blue", "black", 90 }, fg = "blue" },
    DiffText = { bg = { "blue", "black", 30 }, fg = { "blue", -50 }, bold = true },

    NeogitDiffAdd = { fg = "green", bg = "NONE" },
    NeogitDiffAddHighlight = { fg = "green", bg = "NONE" },
    NeogitDiffDelete = { fg = "red", bg = "NONE" },
    NeogitDiffDeleteHighlight = { fg = "red", bg = "NONE" },
  },
  hl_add = {
    NeogitDiffAddInline = { bg = { "green", "black", 30 }, fg = { "green", -50 }, bold = true },
    NeogitDiffDeleteInline = { bg = { "red", "black", 30 }, fg = { "red", -50 }, bold = true },
  },
  theme_toggle = { "gruvchad", "rosepine-dawn" },
}

M.ui = {
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
