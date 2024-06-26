return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = false,
    format_after_save = {
      async = true,
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      css = { { "prettierd" } },
      fish = { { "fish_indent" } },
      javascript = { { "prettierd" } },
      json = { { "prettierd" } },
      lua = { "stylua" },
      typescript = { { "prettierd" } },
      typescriptreact = { { "prettierd" } },
    },
  },
}
