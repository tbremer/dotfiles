-- if true then return {} end -- uncomment this line to disable
require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
    follow_current_file = {
      enabled = true,
    },
  },
  --},
  window = {
    position = "right",
  },
}

vim.api.nvim_set_option_value("colorcolumn", "80,120", {})

---
--- original comments that came with this repo
---
--vim.lsp.set_log_level "debug" -- uncomment to enable log level

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
