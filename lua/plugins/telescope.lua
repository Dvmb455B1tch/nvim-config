return
{
	{ 
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
    	dependencies = 
	{ 
	'nvim-lua/plenary.nvim' 
	},
	config =  function()
		local builtin = require("telescope.builtin")
		
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
				prompt_title = "AST Grep (Smart Code Search)"
			})
		end, { desc = "AST Grep - Smart Code Search" })
	end
	}
	-----------------------
}
