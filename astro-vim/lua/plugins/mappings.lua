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
        ["<Leader>q"] = false, -- disable quit via leader
        ["Z"] = { "zz", desc = "Center" },
        [";"] = { ":", desc = "Semi to Colon" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>lq"] = {
          function() vim.diagnostic.reset() end,
          desc = "clear the diagnostics",
        },
        ["<Leader>lH"] = {
          function()
            local hints = vim.lsp.inlay_hint.is_enabled(0)

            require("notify").notify("this could take a minute", vim.log.levels.INFO, {
              title = (hints and "disabling" or "enabling") .. " inlay_hint ",
              hide_from_history = true,
            })

            vim.lsp.inlay_hint.enable(not hints)
          end,
          desc = "enable inlay hints",
        },

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },

        ["@+"] = {
          ":call setreg('+', expand('%'))<CR>",
          desc = "Copy current file to clipboard",
        },

        ["<Leader>fg"] = {
          ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "telescope live grep with args",
        },

        ["<Leader>c"] = {
          ":clo<cr>",
          desc = "close split or tab or whatever",
        },

        ["<Leader>C"] = {
          ":bd<cr>",
          desc = "delete current buffer",
        },
        ["<Del>"] = {
          '"_x',
        },
      },
      t = {},
      i = {
        ["$$"] = { "<esc>$a", desc = "End of Line" },
      },
    },
  },
}
