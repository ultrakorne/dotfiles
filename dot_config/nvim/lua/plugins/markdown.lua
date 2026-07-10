-- ~/.config/nvim/lua/plugins/markdown.lua
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("$HOME/.markdownlint-cli2.yaml"), "--" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("$HOME/.markdownlint-cli2.yaml"), "--fix", "$FILENAME" },
        },
      },
    },
  },
  -- Marksman has no config to disable diagnostics, and it flags every `[[Term]]`
  -- glossary/wiki-link as a "non-existent"/"ambiguous" document. Those links are
  -- intentional (docs glossary + memory notes), so silence marksman diagnostics
  -- while keeping its completion/nav/hover. markdownlint (style) is unaffected.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
        },
      },
    },
  },
}
