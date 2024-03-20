return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<Leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle" },
    {
      "<Leader>o",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Neotree focus",
    },
  },
  config = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      }
    },
    window = {
      position = "right"
    },
  },
}
