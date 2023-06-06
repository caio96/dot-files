-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move highlighted text
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Half page jump keeps cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search items centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't copy pasted over text
vim.keymap.set("x", "p", [["_dP]])

-- Ctrl-backspace deletes word
vim.keymap.set('i', '<C-BS>', '<C-W>', {noremap = false})
vim.keymap.set('!', '<C-h>', '<C-w>')
vim.keymap.set('!', '<C-BS>', '<C-w>')
vim.keymap.set('i', '<C-w>', '<C-\\><C-o>dB')
vim.keymap.set('i', '<C-BS>', '<C-\\><C-o>dB')

-- <leader>d or D cut text
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
vim.keymap.set({"n"}, "<leader>D", [["+D]])

-- d,D,x delete instead of cutting
vim.keymap.set({"n", "v"}, "d", [["_d]])
vim.keymap.set({"n", "v"}, "x", [["_x]])
vim.keymap.set({"n", "v"}, "D", [["_D]])

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Go to next or previous buffer
vim.keymap.set('n', '<C-k>', ':bp<CR>')
vim.keymap.set('n', '<C-j>', ':bn<CR>')

-- Indent multiple times in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')