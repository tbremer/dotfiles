vim.keymap.set("n", ";", ":", { desc = "semicolon acts as colon" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "write file" })
vim.keymap.set("i", "$$", "<esc>$a", { desc = "goto end of line in INSERT mode" })

