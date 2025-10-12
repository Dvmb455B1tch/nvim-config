return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",

	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.netrw = 1
		vim.g.netrwPlugin = 1

		vim.cmd([[highlight NvimTreeNormal guibg=NONE ctermbg=NONE]])
		vim.cmd([[highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE]])
		vim.cmd([[highlight NvimTreeStatusLine guibg=NONE ctermbg=NONE]])
		vim.cmd([[highlight NvimTreeStatusLineNC guibg=NONE ctermbg=NONE]])
		vim.cmd([[highlight NvimTreeCursorColumn guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeCursorLine guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeCursorLineNr guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeNormal guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])

		vim.cmd([[highlight NvimTreeNormalFloat guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeNormalNC guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])

		vim.cmd([[highlight NvimTreeLineNr guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeWinSeparator guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeEndOfBuffer guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreePopup guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeSignColumn guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])

		vim.cmd([[highlight NvimTreeCursorColumn guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeCursorLine guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeCursorLineNr guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])

		vim.cmd([[highlight NvimTreeStatusLine guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])
		vim.cmd([[highlight NvimTreeStatusLineNC guifg=NONE guibg=NONE ctermbg=NONE ctermfg=NONE]])


		local i = 0;
		while (i < 2) do
			if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == "NvimTree_1" then
				vim.cmd("set laststatus=0")
				i = i + 1;
			else
				vim.cmd("set laststatus=2")
				i = i + 1
			end
		end

		local	tree_width = math.floor(vim.api.nvim_win_get_width(0) / 6);
		local	tree_height = math.floor(vim.api.nvim_win_get_height(0));
		local	screen_padding = 5

		nvimtree.setup({
			view = {
				relativenumber = false,
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						width = tree_width,
						height = tree_height - screen_padding,
						col = screen_padding,
						row = screen_padding / 2,
						title = "|   Explorer |",
						title_pos = "left"
					}
				}
			},

			renderer = {
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "╰",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " "
					}
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "▸",
							arrow_open = "▾",
						},
					}
				},
			},

			git = {
				ignore = false,
			},

			actions = {
				file_popup = {
					open_win_config = {
						border = "rounded"
					}
				}
			}
		})
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current folder" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end
}
