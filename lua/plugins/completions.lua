local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local TinyInlineDiagnostic = {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		vim.diagnostic.config({ virtual_text = false })
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
		})
	end,
}
local CmpConf = {
	"hrsh7th/nvim-cmp",
	-- dependencies = {
	--   "hrsh7th/cmp-nvim-lsp-signature-help",
	-- },
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000},
				-- { name = "nvim_lsp_signature_help" },
				-- { name = "vsnip" }, -- For vsnip users.
				{ name = "luasnip", priority = 700}, -- For luasnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
				{ name = "buffer", priority = 500},
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" }, -- order of columns,
				format = function(entry, item)
					item.menu = item.kind
					item = require("cmp-tailwind-colors").format(entry, item)
					if kind_icons[item.kind] then
						item.kind = kind_icons[item.kind] .. " "
					end
					return item
				end,
				-- 	source is also configurable
				-- 	vim_item.menu = ({
				-- 		nvim_lsp = "[LSP]",
				-- 		buffer = "[Buffer]",
				-- 	})[entry.source.name]
				-- 	return vim_item
				-- end,
			},
		})
	end,
}
return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		-- cond = false,
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	CmpConf,
	TinyInlineDiagnostic,
}
