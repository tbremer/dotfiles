return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.pack.svelte", enabled = true },
  { import = "astrocommunity.pack.typescript", enabled = true },
  {
    "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
    },
  },
  {
    dir = "~/dotfiles/astro-vim/plugins/auto-dark",
    lazy = false
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('everforest').setup({
        background = "soft"
      })
    end,
  },
  {
    "nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      render = "wrapped-compact",
      top_down = false,
      timeout = 1000,
    },
  },
  { "nickeb96/fish.vim" },
  { "knsh14/vim-github-link", lazy = false },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
