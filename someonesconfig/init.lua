require("custom.core")
require("custom.lazy")
require('terminal')
require('lazygit_wrapper')

vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
	callback = function()
		if vim.bo.filetype == "alpha" then
			vim.api.nvim_win_set_cursor(0, {1, 0})	-- Force cursor to line 1, column 0
		end
	end
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.cmd("set showtabline=0")	-- Hide bufferline
	end
})

vim.api.nvim_create_autocmd("BufUnload", {
	pattern = "<buffer>",
	callback = function()
		vim.cmd("set showtabline=2")	-- Restore bufferline when leaving Alpha
	end
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		if vim.bo.filetype == "alpha" then
			vim.cmd("close")	-- Close terminal if in Alpha
		end
	end
})

vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight NormalNC guibg=NONE guifg=NONE")
vim.cmd("highlight IndentLineCurrent guibg=NONE guifg=#aaaaaa")
vim.cmd("highlight WinSeparator guifg=#aaaaaa")
vim.cmd("highlight NormalFloat guibg=NONE")
vim.cmd("highlight FloatTitle guibg=NONE")
vim.cmd("highlight Pmenu guibg=NONE")
vim.cmd("highlight PmenuSel guibg=#aaaaaa guifg=#000000")
vim.cmd("highlight CursorLine guibg=NONE")
vim.cmd("highlight WinBar guibg=NONE")
vim.cmd("highlight WinBarNC guibg=NONE")
vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight StatusLineNC guibg=NONE")
vim.cmd("highlight TabLine guibg=NONE")
vim.cmd("highlight TabLineFill guibg=NONE")
vim.cmd("highlight PmenuSbar guibg=NONE guifg=#aaaaaa")
vim.cmd("highlight MsgSeparator guibg=NONE")
vim.cmd("highlight CursorLineFold guibg=NONE")
vim.cmd("highlight CursorLineSign guibg=NONE")
vim.cmd("highlight FoldColumn guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight ToolTip guibg=NONE guifg=#aaaaaa")
vim.cmd("highlight Scrollbar guibg=NONE guifg=#aaaaaa")
vim.cmd("highlight EndOfBuffer guibg=NONE guifg=#000000")
vim.cmd("set termguicolors")

require('transparent').clear_prefix('BufferLine')
require('transparent').clear_prefix('notify')
require('transparent').clear_prefix('nvim-tree')
require('transparent').clear_prefix('mason')
require('transparent').clear_prefix('lazy')
require('transparent').clear_prefix('telescope')
require('transparent').clear_prefix('trouble')

vim.cmd("set laststatus=3")
vim.cmd("set fillchars+=eob:	")
