-- Triger autoread when files changes on disk
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
-- Notification after file change
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
    pattern = { "*" },
})
