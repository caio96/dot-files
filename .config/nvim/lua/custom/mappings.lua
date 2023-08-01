---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
    ["[c"] = "",
    ["]c"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    [":"] = { ";", "", opts = { nowait = true } },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all occurrences of current word" },
    ["H"] = { "^", "Go to the beginning of the line" },
    ["L"] = { "$", "Go to the end of the line" },
    ["ZZ"] = { "<cmd> wqa <CR>", "Save file all buffers and exit" },
  },
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },
  v = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    [":"] = { ";", "", opts = { nowait = true } },
    ["<C-j>"] = { ":m '>+1<CR>gv=gv", "Move highlighted text down" },
    ["<C-k>"] = { ":m '<-2<CR>gv=gv", "Move highlighted text up" },
    ["<C-h>"] = { "<gv", "Indent to the left" },
    ["<C-l>"] = { ">gv", "Indent to the right" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gn"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<leader>gp"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
  },
}

M.nvimtree = {
  n = {
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.symbols_outline = {
  n = {
    ["<F3>"] = { "<cmd> SymbolsOutline <CR>", "Toggle symbols outline" },
  },
}

M.illuminate = {
  n = {
    ["<leader>in"] = {
      function()
        require("illuminate").goto_next_reference()
      end,
      "Move to next illuminated reference",
    },
    ["<leader>ip"] = {
      function()
        require("illuminate").goto_prev_reference()
      end,
      "Move to previous illuminated reference",
    },
  },
}

M.auto_sessions = {
  n = {
    ["<leader>fp"] = { "<cmd> Telescope session-lens search_session <CR>", "Find projects" },
  }
}

M.telekasten = {
  n = {
    ["<leader>z"] = {"<cmd>Telekasten<CR>", "Open Telekasten panel"},
    ["<leader>zf"] = {"<cmd>Telekasten find_notes<CR>", "Find note by name"},
    -- ["<leader>zs"] = {"<cmd>Telekasten search_notes<CR>", "Search in notes"},
    -- ["<leader>zn"] = {"<cmd>Telekasten new_note<CR>", "Create new note"},
    -- ["<leader>zt"] = {"<cmd>Telekasten goto_today<CR>", "Go to today's note"},
    -- ["<leader>zw"] = {"<cmd>Telekasten goto_thisweek<CR>", "Go to this week's note"},
    ["<C-Space>"] = {
      function()
        require('telekasten').toggle_todo()
      end ,
      "Toggle TODO item"
    },
  }
}

M.null_ls = {
  n = {
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  }
}

M.trouble = {
  n = {
    ["<leader>tt"] =  { "<cmd>TroubleToggle<cr>", "Toggle trouble diagnostic indicator"},
    ["<leader>tq"] =  { "<cmd>TroubleToggle quickfix<cr>", "Toggle trouble diagnostic with quickfix items"},
  }
}

M.undotree = {
  n = {
    ["U"] = { "<cmd>UndotreeToggle<cr>", "Toggle undo tree", opts = { remap = true } },
  }
}

M.mini_map = {
  n = {
    ["<leader>mf"] = {
      function()
        require('mini.map').toggle_focus()
      end,
      "Toogle focus on mini map"
    },
    ["<leader>mr"] = {
      function()
        require('mini.map').refresh()
      end,
      "Refresh mini map"
    },
    ["<leader>mt"] = {
      function()
        require('mini.map').toggle()
      end,
      "Toggle mini map"
    },
  }
}

-- Half page jump keeps cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search items centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Disable ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Use x to cut
vim.keymap.set("n", "m", "d")
vim.keymap.set("x", "m", "d")
vim.keymap.set("n", "mm", "dd")
vim.keymap.set("n", "M", "D")

return M
