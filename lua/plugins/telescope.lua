return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope registers" })
			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Telescope lsp document symbols" })
			vim.keymap.set(
				"n",
				"<leader>ws",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Telescope workspace symbols" }
			)
			vim.keymap.set("n", "<leader>pb", builtin.diagnostics, { desc = "Telescope problems" })
			vim.keymap.set("n", "<leader>en", function()
				local opts = require("telescope.themes").get_ivy({
					cwd = vim.fn.stdpath("config"),
					prompt_title = "Neovim Config",
				})
				builtin.find_files(opts)
			end, { desc = "[E]dit [N]eovim config" })
			vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "[T]elescope lsp [R]eferences" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
