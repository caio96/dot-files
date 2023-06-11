local mappings = {}

-- In order to disable a default keymap, use
mappings.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
  },
}

mappings.nvimtree = {
  n = {
    -- toggle
    ["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

mappings.custom = {
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move highlighted text down" },
    ["<A-k>"] = { ":m '>-2<CR>gv=gv", "Move highlighted text up" },
  },
  n = {
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all occurences of current word" },
  },
}

mappings.illuminate = {
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

return mappings
