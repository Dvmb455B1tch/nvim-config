return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local lualine = require("lualine")

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			purple = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#ffffff",
			bg = "NONE",
			inactive_bg = "NONE",
			main_color = "#B4BEFE",
			text_color = "#ffffff",
		}

		local custom = {
			normal = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				y = { bg = colors.bg, fg = colors.fg, gui = "bold" },
			},
			insert = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.green, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				y = { bg = colors.bg, fg = colors.fg, gui = "bold" },
			},
			visual = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.purple, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				y = { bg = colors.bg, fg = colors.fg, gui = "bold" },
			},
			command = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.yellow, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				y = { bg = colors.bg, fg = colors.fg, gui = "bold" },
			},
			replace = {
				a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.red, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg, gui = "bold" },
				y = { bg = colors.bg, fg = colors.fg, gui = "bold" },
			},
			inactive_bg = {
				a = { bg = "NONE", fg = "NONE", gui = "bold" },
				b = { bg = "NONE", fg = "NONE", gui = "bold" },
				c = { bg = "NONE", fg = "NONE", gui = "bold" },
				x = { bg = "NONE", fg = "NONE", gui = "bold" },
				y = { bg = "NONE", fg = "NONE", gui = "bold" },
				z = { bg = "NONE", fg = "NONE", gui = "bold" },
			},
		}

		vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text

		lualine.setup({
			options = {
				theme = custom;
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				disabled_filetypes = { 'alpha', "TelescopePrompt", "NvimTree", "popup" }
			},
			sections = {
				lualine_a = {
					{
						function()
							return "─ "
						end,
						padding = 0,
					},
				},
				lualine_b = {
					{
						function()
							local actual_mode = require("lualine.utils.mode").get_mode()
							local column = vim.api.nvim_win_get_cursor(0)

							if (actual_mode == "NORMAL") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "INSERT") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "VISUAL") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "REPLACE") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "TERMINAL") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "V-BLOCK") then
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							elseif (actual_mode == "COMMAND") then
								return "󰘳 │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							else
								return " │ " .. actual_mode .. " │ " .. tostring((column[2] + 1)) .. " 󰣟 "
							end
						end,
						padding = 0,
					},
				},
				lualine_c = {
					{ "branch" , align = "center" },
					{
						function()
							return " ─"
						end,
						padding = 0,
					},
				},
				lualine_x = {},
				lualine_y = {
					{ require('gitblame').get_current_blame_text, cond = require('gitblame').is_blame_text_available },
				},
				lualine_z = {
					{
						'diagnostics',
						padding = 0,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end
}
