vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "oil://*" },
  callback = function()
    vim.keymap.set("n", "<esc>", "<cmd>clo<cr>", { buffer = 0 })
    vim.keymap.set("n", "q", "<cmd>clo<cr>", { buffer = 0 })
    vim.keymap.set("n", "<bs>", "-", { buffer = 0 })
  end,
})

-- vim.api.nvim_create_autocmd({"VimEnter"}, {} )
