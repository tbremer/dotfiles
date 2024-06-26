return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = function()
    require("which-key").register({
      ["]"] = {
        name = "buffers",
      },
      ["["] = {
        name = "buffers",
      },
      l = {
        name = "lsp",
      },
    })
  end,
  -- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  -- opts = {}
}
