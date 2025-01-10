local Autopairs = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})

		local ts_conds = require("nvim-autopairs.ts-conds")
		-- press % => %% only while inside a comment or string
		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})
	end,
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
}

local Autotag = {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup(
			--     {
			-- 	opts = {
			-- 		-- Defaults
			-- 		enable_close = true, -- Auto close tags
			-- 		enable_rename = true, -- Auto rename pairs of tags
			-- 		enable_close_on_slash = false, -- Auto close on trailing </
			-- 	},
			-- 	-- Also override individual filetype configs, these take priority.
			-- 	-- Empty by default, useful if one of the "opts" global settings
			-- 	-- doesn't work well in a specific filetype
			-- 	per_filetype = {
			-- 		["html"] = {
			-- 			enable_close = false,
			-- 		},
			-- 	},
			-- }
		)
	end,
}
return { Autopairs, Autotag }
