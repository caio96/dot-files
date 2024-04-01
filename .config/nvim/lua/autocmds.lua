require "nvchad.autocmds"

-- Detect large files and disable some functionality that can make it slow
local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > 100000) then
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      -- vim.b.large_buffer = true
    end
  end,
  group = aug,
  pattern = "*",
})

--------------------------------------------------------------------

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

-- Add command to remove trailing whitespace in the whole file
vim.api.nvim_create_user_command("StripWhitespace", function()
  if not vim.o.binary and vim.o.filetype ~= "diff" then
    local current_view = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(current_view)
  end
end, {})
