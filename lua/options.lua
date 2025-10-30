vim.cmd("set nu")
vim.cmd("set cindent")
vim.cmd("set autoindent")
vim.cmd("set hlsearch")
vim.cmd("set mouse=a")
vim.cmd("set updatetime=250")
vim.cmd("set signcolumn=yes")
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  
  " Enhanced LSP diagnostic highlighting
  hi DiagnosticError guifg=#f38ba8 gui=bold
  hi DiagnosticWarn guifg=#f9e2af gui=bold
  hi DiagnosticInfo guifg=#89b4fa gui=bold
  hi DiagnosticHint guifg=#94e2d5 gui=bold
  
  " Virtual text styling
  hi DiagnosticVirtualTextError guifg=#f38ba8 guibg=NONE gui=italic
  hi DiagnosticVirtualTextWarn guifg=#f9e2af guibg=NONE gui=italic
  hi DiagnosticVirtualTextInfo guifg=#89b4fa guibg=NONE gui=italic
  hi DiagnosticVirtualTextHint guifg=#94e2d5 guibg=NONE gui=italic
  
  " Underline diagnostics
  hi DiagnosticUnderlineError gui=undercurl guisp=#f38ba8
  hi DiagnosticUnderlineWarn gui=undercurl guisp=#f9e2af
  hi DiagnosticUnderlineInfo gui=undercurl guisp=#89b4fa
  hi DiagnosticUnderlineHint gui=undercurl guisp=#94e2d5
]]

-- Terminal settings
vim.o.shell = "fish"  -- Set fish as default shell

-- Window and buffer management improvements
vim.o.splitright = true   -- Split new windows to the right
vim.o.splitbelow = true   -- Split new windows below
vim.o.hidden = true       -- Allow hidden buffers

-- Prevent issues with non-modifiable buffers
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Ensure we can navigate properly between windows
    local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
    if buftype == 'terminal' then
      -- Set terminal-specific options
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end
  end
})
vim.g.terminal_color_0 = "#45475a"
vim.g.terminal_color_1 = "#f38ba8"
vim.g.terminal_color_2 = "#a6e3a1"
vim.g.terminal_color_3 = "#f9e2af"
vim.g.terminal_color_4 = "#89b4fa"
vim.g.terminal_color_5 = "#f5c2e7"
vim.g.terminal_color_6 = "#94e2d5"
vim.g.terminal_color_7 = "#bac2de"
vim.opt.relativenumber = true
-- Terminal keybindings are now handled by the toggleterm plugin
-- Remove duplicate terminal keybinding setup to avoid conflicts
