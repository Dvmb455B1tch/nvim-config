return {
  "nvim-treesitter/nvim-treesitter",
  ft = "c",
  config = function()
    -- Ensure C parser is installed
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c" },
    })
    
    -- Inline plugin code
    local ns = vim.api.nvim_create_namespace("function_line_count")
    local group = vim.api.nvim_create_augroup("FunctionLineCount", { clear = true })
    
    local function update_counts()
      local bufnr = vim.api.nvim_get_current_buf()
      local ok, parser = pcall(vim.treesitter.get_parser, bufnr, "c")
      if not ok then return end
      
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
      
      local tree = parser:parse()[1]
      if not tree then return end
      
      local query = vim.treesitter.query.parse("c", "(function_definition) @function")
      
      for _, node in query:iter_captures(tree:root(), bufnr, 0, -1) do
        local start_row, _, end_row, _ = node:range()
        local line_count = end_row - start_row - 1
        local hl = line_count > 25 and "DiagnosticError" or "Comment"
        local msg = string.format(">> FUNCTION LINES: %d <<", line_count)
        
        -- Display AFTER the closing brace (end_row)
        vim.api.nvim_buf_set_extmark(bufnr, ns, end_row, 0, {
          virt_lines = {{ { msg, hl } }},
        })
      end
    end
    
    vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "TextChanged", "TextChangedI"}, {
      pattern = "*.c",
      group = group,
      callback = update_counts
    })
  end
}
