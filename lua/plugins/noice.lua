-- plugins/noice.lua - Noice.nvim plugin configuration for LazyVim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- Required dependencies
    "MunifTanjim/nui.nvim",
    -- Optional: if you want to use the notification view, also install nvim-notify
    "rcarriga/nvim-notify",
  },
  opts = {
    -- LSP configuration
    lsp = {
      -- Override markdown rendering to use Treesitter
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    
    -- Presets for common configurations
    presets = {
      bottom_search = true,         -- Use a classic bottom cmdline for search
      command_palette = true,       -- Position the cmdline and popupmenu together
      long_message_to_split = true, -- Long messages will be sent to a split
      inc_rename = false,           -- Enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- Add a border to hover docs and signature help
    },
    
    -- Message configuration
    messages = {
      enabled = true,               -- Enables the Noice messages UI
      view = "notify",              -- Default view for messages
      view_error = "notify",        -- View for errors
      view_warn = "notify",         -- View for warnings
      view_history = "messages",    -- View for :messages
      view_search = "virtualtext",  -- View for search count messages
    },
    
    -- Popupmenu configuration
    popupmenu = {
      enabled = true,               -- Enables the Noice popupmenu UI
      backend = "nui",              -- Backend to use for regular cmdline completions
      kind_icons = {},              -- Icons for completion item kinds
    },
    
    -- Command line configuration
    cmdline = {
      enabled = true,               -- Enables the Noice cmdline UI
      view = "cmdline_popup",       -- View for rendering the cmdline
      opts = {},                    -- Global options for the cmdline
      format = {
        -- Conceal the actual command line
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {},                 -- Used by input()
      },
    },
    
    -- Notification configuration
    notify = {
      enabled = true,
      view = "notify",
    },
    
    -- Views configuration
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
    
    -- Routes configuration for message filtering and routing
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
    },
  },
  
  -- Optional: Custom keymaps
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  },
}
