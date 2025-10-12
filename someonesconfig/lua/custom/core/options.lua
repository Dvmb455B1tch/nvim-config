vim.cmd("let g:netrw_liststyle = 3")

local parameter = vim.opt

-- indentation
parameter.relativenumber = true
parameter.number = true

parameter.expandtab = false
parameter.shiftwidth = 4
parameter.tabstop = 4
parameter.autoindent = true

-- search related
parameter.ignorecase = true
parameter.smartcase = true

-- visualisation
parameter.cursorline = true

-- backspace
parameter.backspace = "indent,eol,start"

-- clipboard(have access to clipboard outside of vim)
parameter.clipboard:append("unnamedplus")

-- split windows
parameter.splitright = true
parameter.splitbelow = true

-- color correction
parameter.termguicolors = true
parameter.background = "dark"
parameter.signcolumn = "yes"

-- undo parameter, stock everything inside a folder in ~/
parameter.undodir = os.getenv("HOME").. "/.nvim_undo_folder/"
parameter.undofile = true

-- never create a fuc**** swap files again
parameter.swapfile = false

-- indicate the 80th column
parameter.colorcolumn = "80";
parameter.cursorcolumn = false;
