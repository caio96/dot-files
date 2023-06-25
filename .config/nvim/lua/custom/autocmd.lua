-- Avoid scrolling when changing buffers ---------------------------

-- Save current view settings on a per-window, per-buffer basis.
vim.api.nvim_create_autocmd({"BufLeave"}, {
  pattern = {"*"},
  callback = function()
    vim.cmd([[
      if !exists("w:SavedBufView")
          let w:SavedBufView = {}
      endif
      let w:SavedBufView[bufnr("%")] = winsaveview()
    ]])
  end,
})

-- Save current view settings on a per-window, per-buffer basis.
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*"},
  callback = function()
    vim.cmd([[
      let buf = bufnr("%")
      if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
          let v = winsaveview()
          let atStartOfFile = v.lnum == 1 && v.col == 0
          if atStartOfFile && !&diff
              call winrestview(w:SavedBufView[buf])
          endif
          unlet w:SavedBufView[buf]
      endif
    ]])
  end,
})

--------------------------------------------------------------------
