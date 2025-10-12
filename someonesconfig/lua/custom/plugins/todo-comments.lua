return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependecies = { "nvim-lua/plenary.nvim" },

	config = function()
		local todo_comments = require("todo-comments")

		local keymap = vim.keymap

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Go to the next TODO comments" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Go to the previous TODO comments" })

		todo_comments.setup()

	end
}
