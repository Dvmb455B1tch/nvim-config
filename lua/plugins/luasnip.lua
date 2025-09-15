return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  },
  config = function(_, opts)
    local luasnip = require("luasnip")
    luasnip.config.set_config(opts)
    
    -- Load vscode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    
    -- Custom C snippets to override the default ones
    luasnip.add_snippets("c", {
      -- Override main function to use return 0 instead of EXIT_SUCCESS (with argc, argv)
      luasnip.snippet("main", {
        luasnip.text_node("int main (int argc, char *argv[])"),
        luasnip.text_node({"", "{"}),
        luasnip.text_node({"", "\t"}),
        luasnip.insert_node(1),
        luasnip.text_node({"", "\treturn 0;"}),
        luasnip.text_node({"", "}"})
      }),
      
      -- Simple main without parameters (if you ever want it)
      luasnip.snippet("mains", {
        luasnip.text_node("int main ()"),
        luasnip.text_node({"", "{"}),
        luasnip.text_node({"", "\t"}),
        luasnip.insert_node(1),
        luasnip.text_node({"", "\treturn 0;"}),
        luasnip.text_node({"", "}"})
      }),
      
      -- Main with void parameter (explicit)
      luasnip.snippet("mainv", {
        luasnip.text_node("int main (void)"),
        luasnip.text_node({"", "{"}),
        luasnip.text_node({"", "\t"}),
        luasnip.insert_node(1),
        luasnip.text_node({"", "\treturn 0;"}),
        luasnip.text_node({"", "}"})
      }),
    })
    
    -- Note: Only modifying C language snippets
    -- C++ and other languages remain unchanged
    
    -- Optional: load snippets from ~/.config/nvim/snippets
    -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    
    -- Keybindings
    local map = vim.keymap.set
    local options = { silent = true, expr = true }
    map({ "i", "s" }, "<Tab>", function()
      return luasnip.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
    end, options)
    map({ "i", "s" }, "<S-Tab>", function()
      return luasnip.jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
    end, options)
  end,
}
