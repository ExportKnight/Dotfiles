return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = require("lualine.themes.moonfly"),
			},
		})

		-- Make the statusline transparent
		vim.cmd([[
			hi StatusLine guibg=NONE ctermbg=NONE
			hi StatusLineNC guibg=NONE ctermbg=NONE
		]])
	end,
}

