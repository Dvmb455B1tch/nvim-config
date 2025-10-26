return {
    {
        "webhooked/kanso.nvim",
        name = "kanso",
        priority = 1000,
        
        config = function()
            -- Configure kanso with transparency enabled
            require("kanso").setup({
                transparent = true,
                theme = "zen",
            })
            
            -- Set the colorscheme
            vim.cmd.colorscheme "kanso"
            
            -- Fix notify background after colorscheme loads
            vim.cmd([[
                highlight NotifyBackground guibg=#000000
                highlight NotifyERRORBackground guibg=#000000
                highlight NotifyWARNBackground guibg=#000000
                highlight NotifyINFOBackground guibg=#000000
                highlight NotifyDEBUGBackground guibg=#000000
                highlight NotifyTRACEBackground guibg=#000000
            ]])
        end
    }
}
