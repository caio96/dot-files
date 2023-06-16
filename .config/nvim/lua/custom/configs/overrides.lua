local M = {}

M.treesitter = {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "cmake",
    "cpp",
    "dockerfile",
    "json",
    "llvm",
    "markdown",
    "markdown_inline",
    "make",
    "python",
    "tablegen",
    "yaml",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lsp
    "bash-language-server",
    "cmake-language-server",
    "clangd",
    "dockerfile-language-server",
    "lua-language-server",
    "python-lsp-server",
    -- linter
    "cmakelint",
    "hadolint",
    "shellcheck",
    -- formatter
    "beautysh",
    "black",
    "clang-format",
    "prettier",
    "stylua",
    "isort",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.indent_blankline = {
  show_current_context_start = false,
}

return M
