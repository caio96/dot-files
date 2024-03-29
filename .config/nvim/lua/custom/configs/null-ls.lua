local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  lint.cmake_lint,
  lint.hadolint,
  lint.shellcheck,

  formatting.beautysh.with({
    args = {
      "--indent-size",
      "2",
      "$FILENAME"
    },
  }),
  formatting.black,
  formatting.clang_format,
  formatting.isort,
  formatting.prettier.with { filetypes = { "markdown"} }, -- so prettier works only on these filetypes
  formatting.stylua,
}

null_ls.setup {
  debug = false,
  sources = sources,
}
