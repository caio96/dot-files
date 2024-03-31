local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "bashls", "cmake", "dockerls", "pylsp" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Custom config for clangd
lspconfig["clangd"].setup {
  cmd = {
    "clangd",
    "-header-insertion=never",
  },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Disable inline diagnostics and underlining
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
}
