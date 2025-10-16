return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- nvim-cmp/float border order: tl, t, tr, r, br, b, bl, l
      -- Matches your Telescope rounded style
      local cmp_border = { "╭","─","╮","│","╯","─","╰","│" }

      -- Link cmp float styling to Telescope’s highlights (transparent)
      local function link_cmp_hl()
        pcall(vim.api.nvim_set_hl, 0, 'CmpNormal', { link = 'TelescopeNormal' })
        pcall(vim.api.nvim_set_hl, 0, 'CmpBorder', { link = 'TelescopeBorder' })
      end
      vim.api.nvim_create_autocmd('ColorScheme', { callback = link_cmp_hl })
      link_cmp_hl()

      cmp.setup({
        preselect = cmp.PreselectMode.Item,
        completion = { completeopt = 'menu,menuone,noinsert' },

        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        window = {
          completion = cmp.config.window.bordered({
            border = cmp_border,
            winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
          }),
          documentation = cmp.config.window.bordered({
            border = cmp_border,
            winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
          }),
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              cmp.confirm({ select = true })
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<C-e>'] = cmp.mapping.abort(),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        }),

        formatting = {
          fields = { 'abbr', 'menu', 'kind' },
          format = function(entry, item)
            local menus = { nvim_lsp = '[LSP]', buffer = '[Buf]', path = '[Path]', luasnip = '[Snip]' }
            item.menu = menus[entry.source.name] or ''
            return item
          end,
        },

        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}
