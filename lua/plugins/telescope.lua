return
{
	{ 
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
    	dependencies = 
	{ 
	'nvim-lua/plenary.nvim' 
	},
	config =  function()
		local telescope = require('telescope')
		local builtin = require("telescope.builtin")
		
		-- Configure Telescope with transparent windows
		telescope.setup({
			defaults = {
				-- Window configuration for transparency
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				winblend = 0, -- Fully transparent background
			},
			pickers = {
				find_files = {
					winblend = 0,
				},
				live_grep = {
					winblend = 0,
				},
				grep_string = {
					winblend = 0,
				},
			},
		})
		
		-- Set up transparent highlight groups for Telescope
		local function setup_transparent_telescope()
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE" })
		end
		
		-- Apply transparency after colorscheme loads
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = setup_transparent_telescope,
		})
		
		-- Also apply immediately if already loaded
		setup_transparent_telescope()
		
		-- Standard Telescope key mappings (original setup)
		vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find Files" })
		vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = "Live Grep - Search in All Files" })
	end
   	},
	{
	'ray-x/telescope-ast-grep.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		-- Load the telescope-ast-grep extension for advanced AST searching
		require('telescope').load_extension('ast_grep')
		
		-- Set up Ctrl+Shift+G for AST grep (intelligent code structure search)
		vim.keymap.set('n', '<C-S-g>', function()
			require('telescope').extensions.ast_grep.AST_grep({
				prompt_title = "AST Grep (Smart Code Search)",
				winblend = 0, -- Ensure transparency for AST grep too
			})
		end, { desc = "AST Grep - Smart Code Search" })
	end
	}
	-----------------------
}
