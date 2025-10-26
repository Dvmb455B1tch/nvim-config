return {
    {
        "gelguy/wilder.nvim",
        build = ":UpdateRemotePlugins",
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})
            
            -- Simple pipeline without external dependencies
            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline(),
                    wilder.search_pipeline()
                ),
            })

            wilder.set_option('renderer', wilder.popupmenu_renderer(
                wilder.popupmenu_border_theme({
                    highlights = {
                        border = 'Normal',
                        default = 'Normal',
                    },
                    border = 'rounded',
                    left = {' ', wilder.popupmenu_devicons()},
                    right = {' ', wilder.popupmenu_scrollbar()},
                    max_height = '75%',
                    min_height = 0,
                    prompt_position = 'top',
                    reverse = 0,
                })
            ))
        end,
    }
}
