return {
    {
        "sainnhe/sonokai",
        name = "sonokai",
        priority = 1000,
        
        config = function()
            vim.g.sonokai_style = 'default' -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
            vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_disable_italic_comment = 0
            vim.g.sonokai_sign_column_background = 'none'
            vim.g.sonokai_spell_foreground = 'none'
            vim.g.sonokai_ui_contrast = 'low'
            vim.g.sonokai_show_eob = 1
            vim.g.sonokai_float_style = 'bright'
            vim.g.sonokai_diagnostic_text_highlight = 0
            vim.g.sonokai_diagnostic_line_highlight = 0
            vim.g.sonokai_better_performance = 1
            
            vim.cmd.colorscheme "sonokai"
        end
    }
}
