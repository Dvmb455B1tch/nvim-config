return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		
		config = function()
			-- Available variants:
			vim.cmd.colorscheme("catppuccin-mocha")     -- Current (dark)
			-- vim.cmd.colorscheme("catppuccin-latte")     -- Light theme
			-- vim.cmd.colorscheme("catppuccin-frappe")    -- Dark with warm colors
			-- vim.cmd.colorscheme("catppuccin-macchiato") -- Dark with cool colors
		end
	},
	
	-- Other colorscheme options (uncomment to use):
	--[[
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end
	},
	]]--
	
	--[[
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end
	},
	]]--
}
