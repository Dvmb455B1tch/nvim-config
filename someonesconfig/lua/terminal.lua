local M = {}

M.terminal_buffer = nil
M.terminal_window = nil

-- Compute the size of the floating windows.
-- The terminal will always occupy the right side of the windows if there is enough space.
-- Otherwise it will fill the whole screen
function M.ComputeSize()
	local	width = vim.api.nvim_get_option("columns")
	local	height = vim.api.nvim_get_option("lines")
	local	border_screen_margin = 10
	local	win_width, win_height, row, col = nil;

	if (width > 127)
	then
		win_width = math.floor((width / 2) - border_screen_margin)
		win_height = math.floor((height * 90) / 100)
		row = math.floor(((height * 10) / 100) / 2 - 1)
		col = math.floor((width / 2) + (border_screen_margin / 2))
	else
		win_width = math.floor(width * 0.8)
		win_height = math.floor(height * 0.8)
		row = math.floor((height - win_height) / 2)
		col = math.floor((width - win_width) / 2)
	end
	return {win_width, win_height, row, col}
end

function M.CreateTitle()
	return "   " .. (os.getenv("USER") or "Term") .. " "
end

function M.OpenTerminal()
	local win_width, win_height, row, col = unpack(M.ComputeSize())

	if M.terminal_buffer and vim.api.nvim_buf_is_valid(M.terminal_buffer)
	then
		M.terminal_window = vim.api.nvim_open_win(M.terminal_buffer, true, {
			relative = "editor",
			row = row,
			col = col,
			width = win_width,
			height = win_height,
			style = "minimal",
			border = "rounded",
			title = M.CreateTitle()
		})
		vim.api.nvim_command("startinsert")
		return
	else
		-- Create buffer if it doesn't exist
		M.terminal_buffer = vim.api.nvim_create_buf(false, true)
	end

	-- Create floating window
	M.terminal_window = vim.api.nvim_open_win(M.terminal_buffer, true, {
		relative = "editor",
		row = row,
		col = col,
		width = win_width,
		height = win_height,
		style = "minimal",
		border = "rounded",
		title = M.CreateTitle()
	})

	vim.api.nvim_command("terminal")
	vim.api.nvim_command("startinsert")
end

--Function to toggle the terminal
function M.ToggleTerminal()
	if M.terminal_window and vim.api.nvim_win_is_valid(M.terminal_window) then
		vim.api.nvim_win_hide(M.terminal_window)
		M.terminal_window = nil
	else
		M.OpenTerminal()
	end
end

--Function to resize the window on screen resize
function M.ResizeTerminal()
	if not (M.terminal_window and vim.api.nvim_win_is_valid(M.terminal_window)) then
		return
	end

	local win_width, win_height, row, col = unpack(M.ComputeSize())
	vim.api.nvim_win_set_config(M.terminal_window, {
		relative = "editor",
		row = row,
		col = col,
		width = win_width,
		height = win_height,
		border = "rounded",
	})
end

--Autocommand to handle resizing
vim.api.nvim_create_autocmd("VimResized",{
	pattern = "*",
	callback = M.ResizeTerminal,
})

--Keymap to toggle terminal
vim.api.nvim_set_keymap("n","<S-TAB>", "<cmd>lua require('terminal').ToggleTerminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t","<S-TAB>", "<C-\\><C-N>:lua require('terminal').ToggleTerminal()<CR>", { noremap = true, silent = true })

return (M)
