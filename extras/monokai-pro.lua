return {
    {
        "loctvl842/monokai-pro.nvim",
        name = "monokai-pro",
        priority = 1000,
        
        config = function()
            require("monokai-pro").setup({
                transparent_background = true,
                terminal_colors = true,
                devicons = true,
                filter = "pro", -- "classic", "octagon", "pro", "machine", "ristretto", "spectrum"
                day_night = {
                    enable = false,
                    day_filter = "pro",
                    night_filter = "spectrum",
                },
                inc_search = "background",
                background_clear = {
                    "float_win",
                    "toggleterm",
                    "telescope",
                    "which-key",
                    "renamer",
                    "notify",
                    "nvim-tree",
                    "neo-tree",
                    "bufferline",
                },
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                    indent_blankline = {
                        context_highlight = "default",
                        context_start_underline = false,
                    },
                },
            })
            
            vim.cmd.colorscheme "monokai-pro"
        end
    }
}
