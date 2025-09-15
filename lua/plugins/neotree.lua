return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            -- Keybindings
            vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = "Toggle Neo-tree" })
            vim.keymap.set('n', '<leader>n', ':Neotree focus<CR>', { desc = "Focus Neo-tree" })
            
            require("nvim-web-devicons").setup({ default = true })
            
            require("neo-tree").setup({
                close_if_last_window = false,
                popup_border_style = "single",
                enable_git_status = true,
                enable_diagnostics = true,
                sort_case_insensitive = true,
                
                window = {
                    position = "left",
                    width = 28,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                },
                
                default_component_configs = {
                    container = {
                        enable_character_fade = true,
                        width = "100%",
                        right_padding = 0,
                    },
                    indent = {
                        indent_size = 2,
                        padding = 0,
                        with_markers = false, -- Remove the lines completely
                        indent_marker = "",
                        last_indent_marker = "",
                        with_expanders = true,
                        expander_collapsed = "▸", 
                        expander_expanded = "▾",
                        expander_highlight = "NeoTreeExpander",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        folder_empty_open = "",
                        default = "",
                        highlight = "NeoTreeFileIcon",
                    },
                    modified = {
                        symbol = "●",
                        highlight = "NeoTreeModified",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            added     = "",
                            modified  = "",
                            deleted   = "",
                            renamed   = "",
                            untracked = "",
                            ignored   = "",
                            unstaged  = "",
                            staged    = "",
                            conflict  = "",
                        }
                    },
                },
                
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = false,
                    },
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = true,
                    },
                    group_empty_dirs = true,
                    hijack_netrw_behavior = "open_default",
                    use_libuv_file_watcher = false,
                },
                
                -- Remove status line at bottom
                source_selector = {
                    winbar = false,
                    statusline = false,
                    show_scrolled_off_parent_node = false,
                    sources = {
                        { source = "filesystem" },
                        { source = "buffers" },
                        { source = "git_status" },
                    },
                    content_layout = "start",
                },
            })
            
            -- Completely transparent and borderless styling
            local function setup_transparent_neotree()
                -- Complete transparency
                vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })
                
                -- Remove ALL borders and separators (including the white line)
                vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeStatusLineNC", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE" })
                
                -- Additional separator removal
                vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", fg = "NONE" })
                
                -- Remove tab/source selector completely
                vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "NONE", fg = "NONE" })
                vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { bg = "NONE", fg = "NONE" })
                
                -- Minimalist expanders and content
                vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#89b4fa", bold = false })
                vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "NONE" }) -- Make invisible
                
                -- Clean directory and file styling  
                vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#cdd6f4" })
                vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#fab387" })
                
                -- Subtle git colors
                vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#a6e3a1" })
                vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#f9e2af" })
                vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#f38ba8" })
                vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#94e2d5" })
                vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#6c7086" })
                
                -- Modified indicator
                vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = "#f9e2af" })
            end
            
            -- Apply immediately and on colorscheme change
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = setup_transparent_neotree,
            })
            
            vim.schedule(setup_transparent_neotree)
            
            -- Hide the winbar/tabline at the top and remove separator
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "neo-tree",
                callback = function()
                    vim.opt_local.winbar = ""
                    vim.opt_local.statuscolumn = ""
                    -- Force remove the separator for neo-tree windows
                    vim.wo.fillchars = "vert: ,vertleft: ,vertright: ,verthoriz: "
                end,
            })
            
            -- Global separator removal
            vim.opt.fillchars = { vert = " ", vertleft = " ", vertright = " ", verthoriz = " " }
        end,
    }
}
