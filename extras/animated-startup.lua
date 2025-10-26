return {
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Animated header (cycles through different ASCII art)
            local headers = {
                {
                    "                                   ",
                    "                                   ",
                    "                                   ",
                    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
                    "                                   ",
                },
                {
                    "    ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                    "    ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                    "    ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                    "    ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                    "    ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                    "    ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                    "",
                    "                [ Coding like a beast ]                    ",
                },
                {
                    "                          ▄▄▄▄▄▄▄▄▄",
                    "                      ▄▀█▀█▀█▀█▀█▀█▀█▄",
                    "                  ▄▄▄█▄▄▄▄▄▄▄▄▄▄▄▄▄▄█▄▄▄",
                    "              ▄▄██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██▄▄",
                    "            ▄█▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▀█▄",
                    "          ▄█▀▄▄██▀▀▀▀▀██▄▄▄▄▄▄▄▄██▀▀▀▀▀██▄▄▀█▄",
                    "         ▄█▀▄██▀▀▄▄▄▄▄▄▀▀██▄▄▄▄██▀▀▄▄▄▄▄▄▀▀██▄▀█▄",
                    "        ▄█▀▄██▀▄▄█▀▀▀▀▀█▄▄▀▀█▄▄█▀▀▄▄█▀▀▀▀▀█▄▄▀██▄▀█▄",
                    "       ▄█▀▄██▀▄███▄▄▄▄▄████▄▄▀█▀▄▄████▄▄▄▄▄███▄▀██▄▀█▄",
                    "      ▄█▀▄██▀▄████████████████▄▀▄████████████████▄▀██▄▀█▄",
                    "     ▄█▀▄██▀▄██████████████████▀██████████████████▄▀██▄▀█▄",
                    "",
                    "                    [ Welcome to the Matrix ]              ",
                }
            }

            -- Random header selection
            local header = headers[math.random(#headers)]
            dashboard.section.header.val = header

            -- Custom buttons with cool icons
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
                dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
                dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
            }

            -- Custom footer with time and motivational quote
            local function footer()
                local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
                local version = vim.version()
                local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

                local quotes = {
                    "Code is like humor. When you have to explain it, it's bad.",
                    "The best error message is the one that never shows up.",
                    "Any fool can write code that a computer can understand.",
                    "Programs must be written for people to read.",
                    "Simplicity is the ultimate sophistication.",
                    "Make it work, make it right, make it fast.",
                    "The only way to go fast is to go well.",
                }
                
                local quote = quotes[math.random(#quotes)]
                
                return datetime .. nvim_version_info .. "\n \n" .. quote
            end

            dashboard.section.footer.val = footer()

            dashboard.config.opts.noautocmd = true

            alpha.setup(dashboard.config)
        end,
    }
}
