-- Suppress lspconfig deprecation warnings
vim.deprecate = function() end

-- Override vim.notify to filter lspconfig warnings
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and (
    msg:find("require.*lspconfig") or 
    msg:find("framework.*is deprecated") or 
    msg:find("Feature will be removed") or
    msg:find("use vim.lsp.config")
  ) then
    return
  end
  return original_notify(msg, level, opts)
end
