return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = false,
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 3,
      max_width = 80,
      -- max_height = ,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
