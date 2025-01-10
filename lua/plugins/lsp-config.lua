local mason = {
	"williamboman/mason.nvim",
	lazy = false,
	config = function()
		require("mason").setup()
	end,
}

local mason_lspconfig = {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	opts = {
		auto_install = true,
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"tailwindcss",
		},
	},
}

local nvim_lspconfig = {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		-- local function on_attach(client, bufnr)
		--   vim.api.nvim_create_autocmd("CursorMovedI", {
		--     buffer = bufnr,
		--     callback = function()
		--       vim.lsp.buf.signature_help()
		--     end,
		--   })
		-- end
		--
		-- -- Configure signature_help handler
		-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		--   vim.lsp.handlers.signature_help, {
		--     border = "rounded",  -- You can use "single", "double", "rounded", "solid", "shadow"
		--     focusable = false,
		--     relative = "cursor",
		--     col = 0,
		--     row = -1,  -- Show above the current line
		--   }
		-- )
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.ts_ls.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.tailwindcss.setup({ capabilities = capabilities })

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
		vim.keymap.set({ "n", "i" }, "<c-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		-- show document symbols
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
	end,
}
return { mason, mason_lspconfig, nvim_lspconfig }
