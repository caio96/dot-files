---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  }
}

M.nvimtree = {
  n = {
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.custom = {
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move highlighted text down" },
    ["<A-k>"] = { ":m '>-2<CR>gv=gv", "Move highlighted text up" },
  },
  n = {
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all occurences of current word" },
  },
}

M.illuminate = {
  n = {
    ["<leader>nr"] = {
      function()
        require("illuminate").goto_next_reference()
      end,
      "Move to [n]ext illuminated [r]eference",
    },
    ["<leader>pr"] = {
      function()
        require("illuminate").goto_prev_reference()
      end,
      "Move to [p]revious illuminated [r]eference",
    },
  },
}

M.telekasten = {
  n = {
    ["<leader>z"] = {"<cmd>Telekasten<CR>", "Open Telekasten panel"},
    ["<leader>zf"] = {"<cmd>Telekasten find_notes<CR>", "Find note by name"},
    ["<leader>zs"] = {"<cmd>Telekasten search_notes<CR>", "Search in notes"},
    ["<leader>zn"] = {"<cmd>Telekasten new_note<CR>", "Create new note"},
    ["<leader>zt"] = {"<cmd>Telekasten goto_today<CR>", "Go to today's note"},
    ["<leader>zw"] = {"<cmd>Telekasten goto_thisweek<CR>", "Go to this week's note"},
    ["<C-Space>"] = {
      function()
        require('telekasten').toggle_todo()
      end ,
      "Toggle TODO"
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

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" }})
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" }})
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
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

-- Half page jump keeps cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search items centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't copy pasted over text
vim.keymap.set("x", "p", [["_dP]])

-- <leader>d or D cut text
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set({ "n" }, "<leader>D", [["+D]])

-- d,D,x delete instead of cutting
vim.keymap.set({ "n", "v" }, "d", [["_d]])
vim.keymap.set({ "n", "v" }, "x", [["_x]])
vim.keymap.set({ "n", "v" }, "D", [["_D]])

-- Indent multiple times in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

return M
