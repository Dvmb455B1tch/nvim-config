return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
		local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        local logo = {
			"                                   ",
            "╭──────────────────────────────────╮",
            "│ ╭──────────────────────────────╮ │",
            "│ │ ╭───────│──────────│───────╮ │ │",
            "│ │ │ ╭─────│──────────│─────╮ │ │ │",
            "│ │ │ │ ╭───│──────────│───╮ │ │ │ │",
            "│ │ │ │ │ ╭─│──────────│─╮ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ │ │──────────│ │ │ │ │ │ │",
            "│ │ │ │ │ ╰─│──────────│─╯ │ │ │ │ │",
            "│ │ │ │ ╰───│──────────│───╯ │ │ │ │",
            "│ │ │ ╰─────│──────────│─────╯ │ │ │",
            "│ │ ╰───────│──────────│───────╯ │ │",
            "│ ╰──────────────────────────────╯ │",
            "╰──────────────────────────────────╯",
			"          Press 󰌑 to start          "
        }

        -- Function to generate padding
        local function center_logo()
            local win_height = vim.api.nvim_win_get_height(0)
            local logo_height = #logo
            local padding = math.floor((win_height - logo_height) / 2)

            local new_header = {}
            -- Add empty lines for padding
            for _ = 1, padding do
                table.insert(new_header, " ")
            end
            -- Append ASCII logo
            for _, line in ipairs(logo) do
                table.insert(new_header, line)
            end

            return new_header
        end
        dashboard.section.header.val = center_logo()
        dashboard.section.buttons.val = {}
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#aaaaaa", bold = true })
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.footer.val = {
			" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "

		}
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
			    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", ":Telescope find_files<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_hl(0, "Cursor", { fg = "#FF0000", bg = "none" })
			end,
		})
		vim.api.nvim_create_autocmd("BufLeave", {
			pattern = "alpha",
			callback = function()
				vim.api.nvim_set_hl(0, "Cursor", { fg = "none", bg = "#aaaaaa" })
			end,
		})
 		alpha.setup(dashboard.config)
    end
}
