lvim.leader = ","
lvim.keys.normal_mode[";"] = ":"
lvim.keys.normal_mode["<leader>t"] = "<cmd>NvimTreeToggle<CR>"
lvim.keys.normal_mode["<leader>n"] = "<cmd>BufferLineCycleNext<CR>"
lvim.format_on_save = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  }
}

lvim.builtin.bufferline.options.numbers = "buffer_id"
lvim.builtin.nvimtree.on_config_done = function()
  require('nvim-tree').setup {
    sync_root_with_cwd = false,
    git = {
      ignore = false
    },
  }
end


--local tree = require "nvim-tree"
--tree.setup {
--  sync_root_with_cwd = false
--}

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
