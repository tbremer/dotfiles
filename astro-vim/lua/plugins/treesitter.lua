--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- Additional text objects for treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "comment",
      "css",
      "dockerfile",
      "fish",
      "gleam",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "rust",
      "sql",
      "svelte",
      "tsx",
      "typescript",
      "vim",
    })
  end,
}
