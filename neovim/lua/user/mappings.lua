-- normal mode
vim.keymap.set("n", ";", ":", { desc = "semicolon acts as colon" })
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "write file" })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { desc = "force quit" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "open 🛢️ float" })
vim.keymap.set("n", "<leader>c", "<cmd>clo<cr>", { desc = "close current window" })
--vim.keymap.set("n", "<Space>", "<CR>", { desc = "space as enter" })
vim.keymap.set("n", "q", "<Nop>", { desc = "disable recording" })
vim.keymap.set("n", "<c-z>", "<Nop>", { desc = "disable quit with Ctrl-Z" })
vim.keymap.set("n", "bn", "<cmd>bnext<cr>", { desc = "next buffer" })
vim.keymap.set("n", "bp", "<cmd>bprev<cr>", { desc = "previous buffer" })

-- insert mode
vim.keymap.set("i", "$$", "<esc>$a", { desc = "goto end of line in INSERT mode" })

-- visual mode
vim.keymap.set("v", "<c-d>", "_d", { desc = "delete selected" })

-- telescope
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "📡 live grep" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "📡 find files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "📡 buffers" })
