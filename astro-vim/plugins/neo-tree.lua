return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      commands = {
        to_parent = function (state)
          local node = state.tree:get_node()
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      },
      window = {
        mappings = {
          U = "to_parent"
        },
      },
    },
  },
}

