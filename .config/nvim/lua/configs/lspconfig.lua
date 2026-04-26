-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "bashls", "clangd", "cmake", "dockerls", "pylsp", "copilot", "mojo" }
vim.lsp.enable(servers)

-- custom clangd config
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
  },
})

-- Register copilot so :checkhealth sidekick sees it before any buffer attaches
vim.lsp.config("copilot", {})

-- Enable copilot inline completion
-- vim.lsp.inline_completion.enable()

-- Disable inline diagnostics and underlining
vim.diagnostic.config {
  severity_sort = true,
  virtual_text = false,
  underline = false,
}
