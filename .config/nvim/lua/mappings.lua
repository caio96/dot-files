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
map({ "n", "v" }, ";", ":", { desc = "General. Enter command mode" })
map({ "n", "v" }, ":", ";", { nowait = true })
map(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "General. Replace all occurrences of current word" }
)
map({ "n", "v" }, "H", "^", { desc = "General. Go to the beginning of the line" })
map({ "n", "v" }, "L", "$", { desc = "General. Go to the end of the line" })
map("i", "<C-s>", "<cmd> w <CR>", { desc = "General. Save file" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "General. Move highlighted text down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "General. Move highlighted text up" })
map("v", "<C-h>", "<gv", { desc = "General. Indent to the left" })
map("v", "<C-l>", ">gv", { desc = "General. Indent to the right" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Go up on wrapped lines" })
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Go down on wrapped lines" })

map("i", "<Up>", "<C-O>gk", { desc = "General. Go up on wrapped lines" })
map("i", "<Down>", "<C-O>gj", { desc = "General. Go down on wrapped lines" })
map("i", "<C-j>", "<C-O>gj", { desc = "General. Go down on wrapped lines" })
map("i", "<C-k>", "<C-O>gk", { desc = "General. Go up on wrapped lines" })
map("v", "p", "P", { desc = "General. Paste without copying" })
map("v", "P", "p", { desc = "General. Paste copying selected text" })

-- Gitsigns
local gitsigns = require "gitsigns"

map("n", "<leader>gn", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Gitsigns. Jump to the next hunk" })
map("n", "<leader>gp", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Gitsigns. Jump to the prev hunk" })

map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Gitsigns. Stage hunk" })
map("n", "<leader>hx", gitsigns.reset_hunk, { desc = "Gitsigns. Discard hunk" })

map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Gitsigns. Stage hunk" })

map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Gitsigns. Discard hunk" })

map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Gitsigns. Preview hunk" })
map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Gitsigns. Preview hunk inline" })

map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end, { desc = "Gitsigns. Blame line" })

map("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns. Diff this" })

-- NvimTree
map("n", "<F2>", "<cmd> NvimTreeToggle <CR>", { desc = "NvimTree. Toggle tree" })

-- SymbolsOutline
map("n", "<F3>", "<cmd> SymbolsOutline <CR>", { desc = "SymbolsOutline. Toggle outline" })

-- Illuminate
map("n", "<leader>in", function()
  require("illuminate").goto_next_reference()
end, { desc = "Illuminate. Move to next illuminated reference" })
map("n", "<leader>ip", function()
  require("illuminate").goto_prev_reference()
end, { desc = "Illuminate. Move to prev illuminated reference" })

-- Telekasten
map("n", "<leader>z", "<cmd> Telekasten panel<CR>", { desc = "Telekasten. Open panel" })
map("n", "<leader>zf", "<cmd> Telekasten find_notes<CR>", { desc = "Telekasten. Find note by name" })
map("n", "<leader>zt", function()
  require("telekasten").toggle_todo()
end, { desc = "Telekasten. Toggle TODO item" })

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble. Toggle diagnostics" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble. Toggle quickfix diagnostics" })

-- UndoTree
map("n", "U", "<cmd> UndotreeToggle <CR>", { desc = "UndoTree. Toogle tree", remap = true })

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

-- Oil
map("n", "<leader>e", "<cmd> Oil --float <CR>", { desc = "Oil. Open parent dir explorer" })

-- Telescope undo
map("n", "<leader>fu", "<CMD>Telescope undo<CR>", { desc = "Telescope Find in undo" })
map("n", "<leader>fg", "<CMD>AdvancedGitSearch search_log_content_file<CR>", { desc = "Telescope Find in past git commits of this file" })

-- Half page jump keeps cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search items centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable ex mode
map("n", "Q", "<nop>")
