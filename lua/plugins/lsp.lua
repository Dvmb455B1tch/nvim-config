return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Function that shows Telescope picker with all function declarations/definitions
        local function goto_definition()
          local word = vim.fn.expand('<cword>')
          local current_file = vim.fn.expand('%:p')
          local current_dir = vim.fn.expand('%:p:h')
          
          -- Collect all occurrences of the function
          local results = {}
          
          -- Helper function to search in a file
          local function search_in_file(filepath)
            if vim.fn.filereadable(filepath) == 0 then
              return
            end
            
            local lines = vim.fn.readfile(filepath)
            local filename = vim.fn.fnamemodify(filepath, ':t')
            local relative_path = vim.fn.fnamemodify(filepath, ':.')
            
            for i, line in ipairs(lines) do
              -- Look for function patterns (declarations and definitions)
              if string.match(line, "%f[%w_]" .. word .. "%s*%(") then
                local trimmed_line = string.gsub(line, "^%s*", "")  -- Remove leading whitespace
                local is_declaration = string.match(line, ";%s*$")  -- Ends with semicolon
                local type_label = is_declaration and "DECL" or "IMPL"
                
                table.insert(results, {
                  filename = relative_path,
                  lnum = i,
                  col = 1,
                  text = string.format("[%s] %s", type_label, trimmed_line),
                  display = string.format("[%s] %s:%d", type_label, filename, i)
                })
              end
            end
          end
          
          -- Search in current file first
          search_in_file(current_file)
          
          -- Search in corresponding header/source files
          local base_name = vim.fn.expand('%:t:r')
          local extensions = {'.h', '.hpp', '.c', '.cpp', '.cc', '.cxx'}
          
          for _, ext in ipairs(extensions) do
            local related_file = current_dir .. '/' .. base_name .. ext
            if related_file ~= current_file then
              search_in_file(related_file)
            end
          end
          
          -- Also search other C/C++ files in the directory
          local all_files = vim.fn.glob(current_dir .. '/*.{h,hpp,c,cpp,cc,cxx}', false, true)
          for _, filepath in ipairs(all_files) do
            if filepath ~= current_file and not string.match(filepath, base_name) then
              search_in_file(filepath)
            end
          end
          
          -- Handle results
          if #results == 0 then
            print('No definitions found for ' .. word .. ', trying LSP...')
            vim.lsp.buf.definition()
            return
          elseif #results == 1 then
            -- Only one result, go directly there
            local result = results[1]
            vim.cmd('edit ' .. result.filename)
            vim.cmd('normal! ' .. result.lnum .. 'G')
            vim.cmd('normal! zz')
            print('Found ' .. word .. ' in ' .. vim.fn.fnamemodify(result.filename, ':t') .. ':' .. result.lnum)
            return
          end
          
          -- Multiple results, show in Telescope
          local pickers = require('telescope.pickers')
          local finders = require('telescope.finders')
          local conf = require('telescope.config').values
          local actions = require('telescope.actions')
          local action_state = require('telescope.actions.state')
          
          pickers.new({}, {
            prompt_title = 'Definitions for "' .. word .. '"',
            finder = finders.new_table {
              results = results,
              entry_maker = function(entry)
                return {
                  value = entry,
                  display = entry.display,
                  ordinal = entry.text,
                  filename = entry.filename,
                  lnum = entry.lnum,
                  col = entry.col,
                }
              end,
            },
            sorter = conf.generic_sorter({}),
            previewer = conf.qflist_previewer({}),
            attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                  vim.cmd('edit ' .. selection.filename)
                  vim.cmd('normal! ' .. selection.lnum .. 'G')
                  vim.cmd('normal! zz')
                end
              end)
              return true
            end,
          }):find()
        end
        
        vim.keymap.set('n', 'gd', goto_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        
        vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', '<leader>fd', '<cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', '<leader>fr', '<cmd>Telescope lsp_references<CR>', opts)
      end
 
      lspconfig.clangd.setup({
        on_attach = on_attach
      })
    end
  },
}
