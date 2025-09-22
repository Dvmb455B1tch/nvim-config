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
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		
		-- Custom terminal picker
		local function terminal_picker()
			pickers.new({}, {
				prompt_title = "Terminal Actions",
				finder = finders.new_table({
					results = {
						{ "New Terminal", "new_terminal" },
						{ "Horizontal Terminal", "horizontal_terminal" },
						{ "Vertical Terminal", "vertical_terminal" },
						{ "Floating Terminal", "floating_terminal" },
						{ "Fish Shell (Float)", "fish_float" },
						{ "Fish Shell (Horizontal)", "fish_horizontal" },
					}
				}),
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						local cmd = selection[2]
						
						if cmd == "new_terminal" then
							vim.cmd("ToggleTerm")
						elseif cmd == "horizontal_terminal" then
							vim.cmd("ToggleTerm direction=horizontal")
						elseif cmd == "vertical_terminal" then
							vim.cmd("ToggleTerm direction=vertical")
						elseif cmd == "floating_terminal" then
							vim.cmd("ToggleTerm direction=float")
						elseif cmd == "fish_float" then
							vim.cmd("ToggleTerm direction=float shell=fish")
						elseif cmd == "fish_horizontal" then
							vim.cmd("ToggleTerm direction=horizontal shell=fish")
						end
					end)
					return true
				end,
			}):find()
		end
		
		-- Enhanced file picker with terminal option
		local function enhanced_find_files()
			pickers.new({}, {
				prompt_title = "Find Files & Actions (type 'terminal' for terminal options)",
				finder = finders.new_oneshot_job({"find", ".", "-type", "f"}, {}),
				sorter = conf.file_sorter({}),
				attach_mappings = function(prompt_bufnr, map)
					-- Default file opening
					actions.select_default:replace(function()
						local current_picker = action_state.get_current_picker(prompt_bufnr)
						local prompt = current_picker:_get_prompt()
						
						-- Check if user typed "terminal"
						if prompt:lower():match("terminal") then
							actions.close(prompt_bufnr)
							terminal_picker()
							return
						end
						
						-- Default file opening behavior
						actions.file_edit(prompt_bufnr)
					end)
					
					-- Add custom mapping for terminal
					map('i', '<C-t>', function()
						actions.close(prompt_bufnr)
						terminal_picker()
					end)
					
					return true
				end,
			}):find()
		end
		
		-- Key mappings
		vim.keymap.set('n', '<C-p>', enhanced_find_files, { desc = "Find Files (type 'terminal' for terminal options)" })
		
		-- Direct terminal access
		vim.keymap.set('n', '<leader>tt', terminal_picker, { desc = "Terminal Picker" })
		vim.keymap.set('n', '<leader>tf', function() vim.cmd("ToggleTerm direction=float shell=fish") end, { desc = "Float Fish Terminal" })
		
		-- Set up Ctrl+G for live grep (search text in all files)
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
