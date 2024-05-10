-- thanks dillon
-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/plugins/telescope.lua
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				cond = vim.fn.executable("cmake") == 1,
			},
		},
		config = function()
			--local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					--mappings = {
					--	i = {
					--		["<C-k>"] = actions.move_selection_previous,
					--		["<C-j>"] = actions.move_selection_next,
					--		["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					--		["<C-x>"] = actions.delete_buffer,
					--	},
					--},
					file_ignore_patterns = {
						".git",
						".next",
						"node_modules",
            "pnpm-lock.yaml",
					},
					hidden = true,
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
}
