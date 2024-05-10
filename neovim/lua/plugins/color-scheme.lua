  return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        background = {
          light = "latte",
          dark = "macchiato",
        },
        highlight_overrides = {
          latte = function()
            return {
              NeoTreeCursorLine = { bg = "#E3E5EB" },
              Folded = { bg = "#E4E9F7" },
            }
          end,
          macchiato = function()
            return {
              NeoTreeCursorLine = { bg = "#3D3E57" },
              Folded = { bg = "#36394A" },
            }
          end,
        },
      }
    end,
  }
