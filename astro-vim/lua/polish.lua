-- if true then return {} end -- uncomment this line to disable
require("neo-tree").setup({
  window = {
    position = "right"
  },
  update_focused_file = {
    enable = true,
  }
})

vim.api.nvim_set_option_value('colorcolumn', "80,120", {})


-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
--vim.filetype.add {
--  extension = {
--    foo = "fooscript",
--  },
--  filename = {
--    ["Foofile"] = "fooscript",
--  },
--  pattern = {
--    ["~/%.config/foo/.*"] = "fooscript",
--  },
--}
