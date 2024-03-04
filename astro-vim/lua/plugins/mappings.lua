-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
-- DESCRIPTIONS:
-- first key is the mode (n,t,i)
-- setting a mapping to false will disable it
-- ["<esc>"] = false,
return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        ["Z"] = { "zz", desc = "Center" },
        [";"] = { ":", desc = "Semi to Colon"},

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },

        ["@+"] = {
          ":call setreg('+', expand('%'))<CR>",
          desc = "Copy current file to clipboard",
        },
      },
      t = {},
      i = {
        ["$$"] = { "<esc>$a", desc = "End of Line" },
      },
    }
  }
}
