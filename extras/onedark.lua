return {
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        priority = 1000,
        
        config = function()
            require('onedark').setup({
                style = 'dark', -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
                transparent = true,
                term_colors = true,
                ending_tildes = false,
                cmp_itemkind_reverse = false,
                
                toggle_style_key = nil,
                toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
                
                code_style = {
                    comments = 'italic',
                    keywords = 'italic',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                
                lualine = {
                    transparent = true,
                },
                
                colors = {},
                highlights = {},
                
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },
            })
            
            require('onedark').load()
        end
    }
}
