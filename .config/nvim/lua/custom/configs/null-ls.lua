local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  lint.cmake_lint,
  lint.hadolint,
  lint.markdownlint,
  lint.shellcheck,

  formatting.beautysh,
  formatting.black,
  formatting.isort,
  formatting.prettier,
  formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
