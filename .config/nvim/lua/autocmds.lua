require "nvchad.autocmds"

-- NvChad's theme toggle skips the ColorScheme event, leaving plugins like
-- barbecue with stale cached colors. Re-fire it after each toggle. The patch
-- must be re-applied each call because base46 reloads its own module via
-- plenary.reload during load_all_highlights, wiping any monkey-patch.
local function patch_toggle_theme()
  local base46 = require("base46")
  local original = base46.toggle_theme
  base46.toggle_theme = function()
    original()
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
    patch_toggle_theme()
  end
end
patch_toggle_theme()

-- OSC52 clipboard provider (works over SSH/tmux without external tools).
-- Copy is sent via OSC 52 (fast, fire-and-forget). Paste uses nvim's unnamed
-- register because OSC 52 paste requires a terminal response that most
-- terminals/tmux configurations don't reliably send, causing nvim to hang
-- on the timeout. To paste from the host system clipboard into nvim, use the
-- terminal's own paste shortcut (Ctrl+Shift+V / middle-click / cmd-V).
local osc52 = require "vim.ui.clipboard.osc52"
local function paste_from_unnamed()
  return vim.split(vim.fn.getreg '"', "\n", { plain = true })
end
vim.g.clipboard = {
  name = "OSC 52 (copy only)",
  copy = { ["+"] = osc52.copy "+", ["*"] = osc52.copy "*" },
  paste = { ["+"] = paste_from_unnamed, ["*"] = paste_from_unnamed },
}

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank { timeout = 200 }
  end,
})

-- Restore last cursor position when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "gitcommit" or ft == "gitrebase" then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

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

-- Delete NvChad's MasonInstallAll (we use mason-tool-installer's command
-- instead). Use User VeryLazy rather than VimEnter — lazy.nvim sometimes
-- defers `lazy = false` plugin config until during VimEnter, so a VimEnter
-- callback can race the command's creation. VeryLazy fires after all startup
-- plugins are configured.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    pcall(vim.api.nvim_del_user_command, "MasonInstallAll")
  end,
})

-- Avoid scrolling when changing buffers: remember each (window, buffer) pair's
-- view on BufLeave and restore it on BufEnter — but only if we'd otherwise
-- land at the very top of the file (so manual jumps still win).
local saved_views = {} ---@type table<integer, table<integer, vim.fn.winsaveview.ret>>

vim.api.nvim_create_autocmd("BufLeave", {
  callback = function(args)
    local win = vim.api.nvim_get_current_win()
    saved_views[win] = saved_views[win] or {}
    saved_views[win][args.buf] = vim.fn.winsaveview()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local win = vim.api.nvim_get_current_win()
    local view = saved_views[win] and saved_views[win][args.buf]
    if not view then
      return
    end
    local cur = vim.fn.winsaveview()
    if cur.lnum == 1 and cur.col == 0 and not vim.wo.diff then
      vim.fn.winrestview(view)
    end
    saved_views[win][args.buf] = nil
  end,
})

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function(args)
    saved_views[tonumber(args.match)] = nil
  end,
})
