local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "clangd", "cmake", "dockerls", "mlir_lsp_server", "pylsp", "tblgen_lsp_server" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Disable inline diagnostics and underlining
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
}
