local M = {}

function M.open_lazygit()
	-- create a new floating buffer + window
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- run lazygit in a terminal inside that buffer
	vim.fn.termopen("lazygit", {
		on_exit = function()
			-- close the floating window if it still exists
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			if vim.api.nvim_buf_is_valid(buf) then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end,
	})

	-- go straight into terminal-insert mode
	vim.cmd("startinsert")
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua require('lazygit_wrapper').open_lazygit()<CR>", { noremap = true, silent = true })

return (M)
