return {
	"filipdutescu/renamer.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("renamer").setup({
			vim.keymap.set(
				{ "n", "i" },
				"<F2>",
				'<cmd>lua require("renamer").rename()<CR>',
				{ noremap = true, silent = true }
			),
		})
	end,
}
