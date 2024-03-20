-- if true then return {} end -- uncomment this line to disable

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.pack.svelte", enabled = true },
  --{ import = "astrocommunity.pack.typescript", enabled = true },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "buffer_id",
      },
    },
  },
  {
    "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
    },
  },
}
