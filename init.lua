----------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath,})
end
----------------
vim.opt.rtp:prepend(lazypath)

-- Suppress deprecation warnings before loading plugins
require("suppress_warnings")

local opts = 

{

}
--
require("lazy").setup("plugins")
require("options")
