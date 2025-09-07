require "nvchad.autocmds"

-- Set LLVM filetype for .ll files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ll",
  callback = function()
    vim.bo.filetype = "llvm"
  end,
})

-- Set Tablegen filetype for .td files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.td",
  callback = function()
    vim.bo.filetype = "tablegen"
  end,
})

-- Add command to remove trailing whitespace in the whole file
vim.api.nvim_create_user_command("StripWhitespace", function()
  if not vim.o.binary and vim.o.filetype ~= "diff" then
    local current_view = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(current_view)
  end
end, {})

-- Disable auto-commenting when inserting newline
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- Avoid scrolling when changing buffers ---------------------------
-- Save current view settings on a per-window, per-buffer basis.
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[
      if !exists("w:SavedBufView")
          let w:SavedBufView = {}
      endif
      let w:SavedBufView[bufnr("%")] = winsaveview()
    ]]
  end,
})
-- Save current view settings on a per-window, per-buffer basis.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd [[
      let buf = bufnr("%")
      if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
          let v = winsaveview()
          let atStartOfFile = v.lnum == 1 && v.col == 0
          if atStartOfFile && !&diff
              call winrestview(w:SavedBufView[buf])
          endif
          unlet w:SavedBufView[buf]
      endif
    ]]
  end,
})
--------------------------------------------------------------------
