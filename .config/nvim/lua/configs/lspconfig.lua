-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = { "bashls", "cmake", "dockerls", "pylsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Custom config for clangd
lspconfig["clangd"].setup {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "-header-insertion=never",
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Disable inline diagnostics and underlining
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
}
