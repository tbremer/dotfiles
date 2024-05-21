return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = false,
    format_on_save = {
      async = true,
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      css = { { "prettierd" } },
      javascript = { { "prettierd" } },
      typescript = { { "prettierd" } },
      typescriptreact = { { "prettierd" } },
      lua = { "stylua" },
    },
  },
}
