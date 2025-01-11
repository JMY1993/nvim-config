return {
	{
		"github/copilot.vim",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function()
					vim.keymap.set("i", "<c-j>", 'copilot#Accept("<CR>")', {
            desc = "Accept copilot suggestion only in copilot-chat buffer",
						silent = true,
            noremap = true,
						expr = true,
					})
				end,
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			vim.keymap.set("n", "<leader>ccq", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end, { desc = "CopilotChat - Quick chat" }),
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
