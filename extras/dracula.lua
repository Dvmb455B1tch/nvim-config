return {
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        priority = 1000,
        
        config = function()
            -- Function to apply variant
            local function apply_dracula_variant(variant_name)
                local variants = {
                    default = { bg = "#282A36", menu = "#21222C" },
                    soft = { bg = "#1e1f29", menu = "#1a1b26" },
                    hard = { bg = "#0d1117", menu = "#161b22" },
                    medium = { bg = "#1f2029", menu = "#191a24" },
                }
                
                local variant = variants[variant_name] or variants.default
                
                require("dracula").setup({
                    colors = {
                        bg = variant.bg,
                        fg = "#F8F8F2",
                        selection = "#44475A",
                        comment = "#6272A4",
                        red = "#FF5555",
                        orange = "#FFB86C", 
                        yellow = "#F1FA8C",
                        green = "#50fa7b",
                        purple = "#BD93F9",
                        cyan = "#8BE9FD",
                        pink = "#FF79C6",
                        menu = variant.menu,
                    },
                    transparent_bg = true,
                    italic_comment = true,
                })
                
                vim.cmd.colorscheme "dracula"
                vim.notify("Applied Dracula " .. variant_name .. " variant", vim.log.levels.INFO)
            end
            
            -- Set default variant
            apply_dracula_variant("medium")  -- Change this to: default, soft, hard, medium
            
            -- Create commands to switch variants
            vim.api.nvim_create_user_command("DraculaDefault", function() apply_dracula_variant("default") end, {})
            vim.api.nvim_create_user_command("DraculaSoft", function() apply_dracula_variant("soft") end, {})
            vim.api.nvim_create_user_command("DraculaHard", function() apply_dracula_variant("hard") end, {})
            vim.api.nvim_create_user_command("DraculaMedium", function() apply_dracula_variant("medium") end, {})
            
            -- Keymaps for quick switching
            vim.keymap.set("n", "<leader>td", function() apply_dracula_variant("default") end, { desc = "Dracula Default" })
            vim.keymap.set("n", "<leader>ts", function() apply_dracula_variant("soft") end, { desc = "Dracula Soft" })
            vim.keymap.set("n", "<leader>th", function() apply_dracula_variant("hard") end, { desc = "Dracula Hard" })
            vim.keymap.set("n", "<leader>tm", function() apply_dracula_variant("medium") end, { desc = "Dracula Medium" })
        end
    }
}
