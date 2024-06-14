return {
  "tzachar/local-highlight.nvim",
  config = function()
    require("local-highlight").setup({
      file_types = {
        "css",
        "fish",
        "html",
        "javascript",
        "json",
        "lua",
        "typescript",
        "typescriptreact",
      },
    })
  end,
}
