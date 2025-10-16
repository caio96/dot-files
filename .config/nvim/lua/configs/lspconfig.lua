-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- "copilot": disable for now
local servers = { "bashls", "clangd", "cmake", "dockerls", "pylsp" }
vim.lsp.enable(servers)

-- custom clangd config
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
  },
}

-- Enable copilot inline completion
-- vim.lsp.inline_completion.enable()

-- Disable inline diagnostics and underlining
vim.diagnostic.config {
  severity_sort = true,
  virtual_text = false,
  underline = false,
}
