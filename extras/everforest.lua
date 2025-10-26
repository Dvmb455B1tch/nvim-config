return {
    {
        "sainnhe/everforest",
        name = "everforest",
        priority = 1000,
        
        config = function()
            -- Background variants: 'hard', 'medium', 'soft'
            vim.g.everforest_background = 'soft'
            
            -- Transparency: 0=disabled, 1=transparent bg, 2=more ui transparent
            vim.g.everforest_transparent_background = 1
            
            -- Performance optimization
            vim.g.everforest_better_performance = 1
            
            -- Style options
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_disable_italic_comment = 0
            vim.g.everforest_cursor = 'auto' -- 'auto', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
            
            -- UI customization
            vim.g.everforest_sign_column_background = 'none'
            vim.g.everforest_spell_foreground = 'none'
            vim.g.everforest_ui_contrast = 'low' -- 'low', 'high'
            vim.g.everforest_show_eob = 1
            vim.g.everforest_float_style = 'bright' -- 'bright', 'dim'
            
            -- Diagnostic options
            vim.g.everforest_diagnostic_text_highlight = 0
            vim.g.everforest_diagnostic_line_highlight = 0
            vim.g.everforest_diagnostic_virtual_text = 'grey'
            
            -- Dim inactive windows
            vim.g.everforest_dim_inactive_windows = 0
            
            -- Set the colorscheme
            vim.cmd.colorscheme "everforest"
        end
    }
}
