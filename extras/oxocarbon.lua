return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon",
        priority = 1000,
        
        config = function()
            vim.opt.background = "dark"
            vim.cmd.colorscheme "oxocarbon"
            
            -- Make background transparent
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    }
}
