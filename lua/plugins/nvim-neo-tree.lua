local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			popup_border_style = "rounded",
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			document_symbols = {
				window = {
					mappings = {
						["t"] = "toggle_node",
						["T"] = "expand_all_nodes",
					},
				},
				follow_cursor = true,
			},
			filesystem = {
				window = {
					last_modified = {
						enable = true,
					},
				},
			},
		})
		vim.keymap.set(
			"n",
			"<C-n>",
			":Neotree filesystem reveal float toggle<CR>",
			{ desc = "Toggle filesystem neotree" }
		)
		vim.keymap.set(
			"n",
			"<leader>ns",
			":Neotree document_symbols reveal float toggle<CR>",
			{ desc = "Toggle document symbols in neotree" }
		)
	end,
}

return { M }
