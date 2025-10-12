vim.g.mapleader = " "

local keymap = vim.keymap

-- Move current line
keymap.set("n", "md", ":<C-u>execute 'move +' . v:count1<CR>", { noremap = true, silent = true })
keymap.set("n", "mu", ":<C-u>execute 'move -' . (v:count1 + 1)<CR>", { noremap = true, silent = true })

-- quit insert mode more quickly
keymap.set("i", "jk", "<ESC>", { desc = "Quit insert mode quickly"})
keymap.set("v", "i", "<ESC>", { desc = "Quit visual mode quickly"})

-- clear all highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear all active highlight" })

-- shortcuts for splitting windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize the size of the splits" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current splits" })

-- shortcuts for incrementing and decrementing numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment the number below the cursor" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement the number below the cursor" })

-- shortcuts for tabs
keymap.set("n", "<C-o>", "<cmd>tabnew<CR><cmd>Telescope find_files<CR>", { desc = "New Tab" })
keymap.set("n", "<C-Left>", "<cmd>tabp<CR>", { desc = "Previous Tab" })
keymap.set("n", "<C-Right>", "<cmd>tabn<CR>", { desc = "Next Tab" })
keymap.set("n", "<C-x>", "<cmd>q<CR>", { desc = "Close Tab" })

-- shortcuts to save the files
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save the current files" })

-- shortcuts to save and format the current files
keymap.set("n", "<C-f>", "<cmd>w | !python3 -m c_formatter_42 %<CR>")

-- show all todo in a trouble toggle
keymap.set("n", "<C-t>", "<cmd>TodoQuickFix<CR>")
