require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remove mappings from nvchad
nomap("n", "<C-c>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
nomap("n", "<C-n>")
nomap("n", "<leader>e")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- General mappings
map({ "n", "v" }, ";", ":", { desc = "General Enter command mode" })
map({ "n", "v" }, ":", ";", { nowait = true })
map("i", "<C-s>", "<cmd> w <CR>", { desc = "General Save file" })

map({ "n", "v" }, "H", "^", { desc = "Move beginning of the line" })
map({ "n", "v" }, "L", "$", { desc = "Move end of the line" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line up" })
map("v", "<C-h>", "<gv", { desc = "Move indent to the left" })
map("v", "<C-l>", ">gv", { desc = "Move indent to the right" })

map("n", "<leader><Tab>", "<cmd> tabNext <CR>", { desc = "Switch to the next tab" })

-- Move up/down on wrapped lines
map("i", "<C-j>", "<C-O>gj", { desc = "Move down" })
map("i", "<C-k>", "<C-O>gk", { desc = "Move up" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("i", "<Up>", "<C-O>gk")
map("i", "<Down>", "<C-O>gj")

-- Paste without copying
map("v", "p", "P")
-- Paste copying selected text
map("v", "P", "p")

-- Half page jump keeps cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search items centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable ex mode
map("n", "Q", "<nop>")

-- Add missing mapping for lsp
map("n", "gsh", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP Signature help" })

--
-- Gitsigns
local gitsigns = require "gitsigns"

map("n", "<leader>gn", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Gitsigns Jump to the next hunk" })
map("n", "<leader>gp", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Gitsigns Jump to the prev hunk" })

map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Gitsigns Stage hunk" })
map("n", "<leader>hx", gitsigns.reset_hunk, { desc = "Gitsigns Discard hunk" })

map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Gitsigns Stage hunk" })

map("v", "<leader>hx", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Gitsigns Discard hunk" })

map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Gitsigns Preview hunk" })
map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Gitsigns Preview hunk inline" })

map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end, { desc = "Gitsigns Blame line" })

--
-- NvimTree
map("n", "<F2>", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTree Toggle tree" })

--
-- SymbolsOutline
map("n", "<F3>", "<cmd> Outline <CR>", { desc = "Outline Toggle outline" })

--
-- Illuminate
map("n", "<leader>in", function()
  require("illuminate").goto_next_reference()
end, { desc = "Illuminate Go to next illuminated reference" })
map("n", "<leader>ip", function()
  require("illuminate").goto_prev_reference()
end, { desc = "Illuminate Go to prev illuminated reference" })

--
-- Trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Toggle diagnostics" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble Toggle quickfix diagnostics" })

--
-- UndoTree
map("n", "U", "<cmd> UndotreeToggle <CR>", { desc = "UndoTree. Toogle tree", remap = true })

--
-- MiniMap
map("n", "<leader>mf", function()
  require("mini.map").toggle_focus()
end, { desc = "MiniMap. Toggle focus" })
map("n", "<leader>mr", function()
  require("mini.map").refresh()
end, { desc = "MiniMap. Refresh" })
map("n", "<leader>mt", function()
  require("mini.map").toggle()
end, { desc = "MiniMap. Toggle map" })

--
-- Oil
map("n", "<leader>e", "<cmd> Oil --float <CR>", { desc = "Oil. Open parent dir explorer" })

--
-- Telescope undo
map("n", "<leader>fu", "<CMD>Telescope undo<CR>", { desc = "Telescope Find in undo" })

--
-- AdvancedGitSearch
map(
  "n",
  "<leader>fg",
  "<CMD>AdvancedGitSearch search_log_content_file<CR>",
  { desc = "Telescope Find in past git commits of this file" }
)
