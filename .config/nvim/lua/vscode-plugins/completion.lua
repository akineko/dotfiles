return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'windwp/nvim-autopairs',
        event = 'BufEnter',
        opts = {},
      },
      {
        'hrsh7th/cmp-vsnip',
        dependencies = { 'hrsh7th/vim-vsnip' },
      },
      {
        'tzachar/cmp-fuzzy-buffer',
        dependencies = {
          {
            'tzachar/fuzzy.nvim',
            dependencies = {
              {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
              },
            },
          },
        },
      },
      {
        'zbirenbaum/copilot-cmp',
        dependencies = { 'zbirenbaum/copilot.lua' },
        config = function()
          require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
          })
          require('copilot_cmp').setup()
        end,
      },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            -- { name = 'nvim_lsp_signature_help' },
            { name = 'vsnip' },
          },
          {
            { name = 'fuzzy_buffer' },
          })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
          { name = 'fuzzy_buffer' },
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done', cmp_autopairs.on_confirm_done()
      )
    end,
  },
}
