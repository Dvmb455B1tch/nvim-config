return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup()

    local api = require("Comment.api")

    -- Normal: toggle comment on the current line
    vim.keymap.set("n", "<leader>/", function()
      api.toggle.linewise.current()
    end, { desc = "Comment: toggle current line" })

    -- Visual: smart toggle comment on the actual selection
    -- - If selection was charwise (v) -> use blockwise comments (/* ... */) when available
    -- - If linewise (V) or blockwise (Ctrl-v) -> use linewise comments
    -- - Feed <ESC> first so the exact selection is used (prevents “wrong block” issues)
    vim.keymap.set("x", "<leader>/", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      local mode = vim.fn.visualmode()  -- 'v' | 'V' | CTRL-V
      vim.api.nvim_feedkeys(esc, "nx", false)

      if mode == "v" then
        -- Prefer true block comments for charwise selections
        api.toggle.blockwise("v")
      else
        -- Linewise for line/block selections
        api.toggle.linewise(mode)
      end
    end, { desc = "Comment: smart toggle selection" })
  end,
}
