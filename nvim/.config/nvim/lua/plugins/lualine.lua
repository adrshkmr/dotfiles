return {
	"nvim-lualine/lualine.nvim",
	qependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "tomorrow_night",
			},
		})
	end,
}
