-- normal mode
vim.keymap.set("n", ";", ":", { desc = "semicolon acts as colon" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "write file" })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { desc = "force quit" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "open 🛢️ float" })
vim.keymap.set("n", "<leader>c", "<cmd>clo<cr>", { desc = "close current window" })
--vim.keymap.set("n", "<Space>", "<CR>", { desc = "space as enter" })

-- insert mode
vim.keymap.set("i", "$$", "<esc>$a", { desc = "goto end of line in INSERT mode" })

-- telescope
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "📡 live grep" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "📡 find files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "📡 buffers" })
