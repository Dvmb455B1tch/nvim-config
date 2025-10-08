----------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath,})
end
----------------
vim.opt.rtp:prepend(lazypath)

-- Add ripgrep to PATH for telescope
local ripgrep_path = "/home/dvmb455b1tch/.config/nvim/ripgrep_extracted/usr/bin"
local current_path = vim.env.PATH or ""
if not string.find(current_path, ripgrep_path, 1, true) then
    vim.env.PATH = ripgrep_path .. ":" .. current_path
end

-- Suppress deprecation warnings before loading plugins
require("suppress_warnings")

local opts = 

{

}
--
require("lazy").setup("plugins")
require("options")
