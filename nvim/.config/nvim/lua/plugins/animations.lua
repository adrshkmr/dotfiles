return {
	-- Mini.animate - Core animations
	-- {
	-- 	"echasnovski/mini.animate",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("mini.animate").setup({
	-- 			cursor = {
	-- 				enable = true,
	-- 				timing = require("mini.animate").gen_timing.cubic({ duration = 100, unit = "total" }),
	-- 			},
	-- 			scroll = {
	-- 				enable = true,
	-- 				timing = require("mini.animate").gen_timing.cubic({ duration = 150, unit = "total" }),
	-- 			},
	-- 			resize = {
	-- 				enable = true,
	-- 				timing = require("mini.animate").gen_timing.cubic({ duration = 100, unit = "total" }),
	-- 			},
	-- 			open = {
	-- 				enable = true,
	-- 				timing = require("mini.animate").gen_timing.cubic({ duration = 150, unit = "total" }),
	-- 			},
	-- 			close = {
	-- 				enable = true,
	-- 				timing = require("mini.animate").gen_timing.cubic({ duration = 150, unit = "total" }),
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- Neoscroll - Smooth scrolling
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("neoscroll").setup({
				mappings = {
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true,
				stop_eof = true,
				respect_scrolloff = false,
				cursor_scrolls_alone = true,
				easing_function = "quadratic",
				pre_hook = nil,
				post_hook = nil,
			})
		end,
	},

	-- Windows - Window animations
	-- {
	-- 	"anuvyklack/windows.nvim",
	-- 	event = "WinNew",
	-- 	dependencies = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("windows").setup({
	-- 			autowidth = {
	-- 				enable = true,
	-- 				winwidth = 5,
	-- 				filetype = {
	-- 					help = 2,
	-- 				},
	-- 			},
	-- 			ignore = {
	-- 				buftype = { "quickfix" },
	-- 				filetype = {
	-- 					"NvimTree",
	-- 					"neo-tree",
	-- 					"undotree",
	-- 					"gundo",
	-- 					"dashboard",
	-- 					"alpha",
	-- 					"snacks_dashboard",
	-- 				},
	-- 			},
	-- 			animation = {
	-- 				enable = true,
	-- 				duration = 200,
	-- 				fps = 30,
	-- 				easing = "in_out_sine",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- -- Indent-blankline - Animated indent guides
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	main = "ibl",
	-- 	config = function()
	-- 		require("ibl").setup({
	-- 			indent = {
	-- 				char = "│",
	-- 				tab_char = "│",
	-- 			},
	-- 			scope = {
	-- 				enabled = true,
	-- 				show_start = true,
	-- 				show_end = false,
	-- 				injected_languages = false,
	-- 				highlight = { "Function", "Label" },
	-- 				priority = 500,
	-- 			},
	-- 			exclude = {
	-- 				filetypes = {
	-- 					"help",
	-- 					"alpha",
	-- 					"dashboard",
	-- 					"neo-tree",
	-- 					"Trouble",
	-- 					"trouble",
	-- 					"lazy",
	-- 					"mason",
	-- 					"notify",
	-- 					"toggleterm",
	-- 					"lazyterm",
	-- 					"snacks_dashboard",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
