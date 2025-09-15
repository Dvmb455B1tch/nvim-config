return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'catppuccin',
                -- Use separators that work with most fonts
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                -- Alternative separators if you have a Nerd Font installed:
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                
                -- Disable icons if font doesn't support them
                icons_enabled = true,
                -- Set to false if you don't have Nerd Fonts
                
                -- Always show statusline
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        -- Use simple characters instead of symbols if needed
                        symbols = {added = '+', modified = '~', removed = '-'},
                        -- Alternative with Nerd Font symbols:
                        -- symbols = {added = ' ', modified = ' ', removed = ' '},
                    },
                    {
                        'diagnostics',
                        -- Use simple characters for diagnostics
                        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'},
                        -- Alternative with Nerd Font symbols:
                        -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                    }
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1, -- Show relative path
                        symbols = {
                            modified = '[+]',      -- Text when file is modified
                            readonly = '[-]',      -- Text when file is readonly
                            unnamed = '[No Name]', -- Text for unnamed buffer
                            newfile = '[New]',     -- Text for new files
                        }
                    }
                },
                lualine_x = {
                    'encoding',
                    {
                        'fileformat',
                        -- Show file format with simple symbols
                        symbols = {
                            unix = 'LF',
                            dos = 'CRLF',
                            mac = 'CR',
                        }
                        -- Alternative with Nerd Font symbols:
                        -- symbols = {
                        --     unix = '',
                        --     dos = '',
                        --     mac = '',
                        -- }
                    },
                    'filetype'
                },
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {'nvim-tree', 'quickfix', 'fugitive'}
        })
    end
}
