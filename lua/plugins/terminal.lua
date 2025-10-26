-- Terminal plugin configuration
return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = "fish", -- Use fish shell as requested
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
			
			-- Terminal keybindings with proper window splitting support
			function _G.set_terminal_keymaps()
				local opts = {buffer = 0}
				-- Exit terminal mode
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
				
				-- Window navigation from terminal mode
				vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
				
				-- Window operations from terminal mode (fix for splitting)
				vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
				vim.keymap.set('t', '<C-w>s', [[<C-\><C-n><C-w>s]], opts)
				vim.keymap.set('t', '<C-w>v', [[<C-\><C-n><C-w>v]], opts)
				vim.keymap.set('t', '<C-w>n', [[<C-\><C-n><C-w>n]], opts)
			end

			-- Apply terminal keymaps when entering terminal
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
			
			-- Add normal mode window splitting keybindings for consistency
			vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontally" })
			vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" })
			vim.keymap.set('n', '<leader>sc', '<C-w>c', { desc = "Close current window" })
			vim.keymap.set('n', '<leader>so', '<C-w>o', { desc = "Close other windows" })
		end,
	},
}
