vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "oil://*" },
  callback = function()
    vim.keymap.set("n", "<esc>", "<cmd>clo<cr>", { buffer = 0 })
    vim.keymap.set("n", "q", "<cmd>clo<cr>", { buffer = 0 })
    vim.keymap.set("n", "<bs>", "-", { buffer = 0 })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf" },
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      local win = vim.api.nvim_get_current_win()

      vim.cmd("normal! <CR>")

      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end, { buffer = true })
  end,
})
