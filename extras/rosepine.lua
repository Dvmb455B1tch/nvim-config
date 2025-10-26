return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- "main", "moon", "dawn"
                dark_variant = "main", -- "main", "moon"
                disable_background = true, -- Transparent background
                disable_float_background = true,
                disable_italics = false,
                
                groups = {
                    background = "none",
                    background_nc = "_experimental_nc",
                    panel = "surface",
                    panel_nc = "base",
                    border = "highlight_med",
                    comment = "muted",
                    link = "iris",
                    punctuation = "subtle",
                },
                
                palette = {
                    -- Override colors if needed
                },
                
                highlight_groups = {
                    -- Custom highlight overrides
                }
            })
            
            vim.cmd.colorscheme "rose-pine"
        end
    }
}
