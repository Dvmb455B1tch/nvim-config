return {
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPre",
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 10, -- Small delay for smoother appearance
          animation = require("mini.indentscope").gen_animation.linear({
            duration = 90, -- 200ms fade-in animation
            unit = "total"
          }),
        },
        mappings = {
          object_scope = "",
          object_scope_with_border = "",
          goto_top = "",
          goto_bottom = "",
        },
        options = {
          border = "both",
          indent_at_cursor = true,
          try_as_border = true,
        },
        symbol = "▏", -- Much thinner line (was "│")
      })
      
      -- Make it white but less harsh
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#e0e0e0" })
    end,
  },
}
