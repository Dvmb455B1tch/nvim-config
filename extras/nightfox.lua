return {
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        priority = 1000,
        
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                    terminal_colors = true,
                    dim_inactive = false,
                    module_default = true,
                    styles = {
                        comments = "italic",
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "italic",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = {
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                }
            })
            
            -- Choose variant: "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox"
            vim.cmd.colorscheme "nightfox"
        end
    }
}
