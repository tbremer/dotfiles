return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "macchiato",
        },
        integrations = {
          barbar = true,
          cmp = true,
          fidget = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          noice = true,
          notify = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
        highlight_overrides = {
          latte = function()
            local t = require("catppuccin.palettes").get_palette("latte")
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
      })

      -- vim.cmd.colorscheme("catppuccin-macchiato")

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
}
