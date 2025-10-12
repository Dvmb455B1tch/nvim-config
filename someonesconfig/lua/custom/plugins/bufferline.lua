return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	version = "*",

	config = function ()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				themable = true,
				show_buffer_icons = false,
				indicator = {
					style = 'none',
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "Explorer",
						highlight = "Directory",
						separator = false,
					},
				},
			},
			highlights = {
				separator = {
					fg = "NONE",
					bg = "NONE",
				},
				separator_visible = {
					fg = "NONE",
					bg = "NONE",
				},
				background = {
					fg = "NONE",
					bg = "NONE",
				},
				close_button = {
					bg = "NONE",
				},
				close_button_visible = {
					bg = "NONE",
				},
				buffer_selected = {
					fg = "#aaaaaa",
					bold = true,
					underline = true,
				},
				buffer_visible = {
					fg = "#050505",
				}
			},
		})
	end,
}
