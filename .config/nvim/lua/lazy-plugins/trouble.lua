return {
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      "folke/todo-comments.nvim",
    },
    event = 'BufEnter',
    keys = {
      { '<leader>xx', ':Trouble diagnostics toggle<CR>' },
      { '<leader>xd', ':Trouble lsp_document_symbols toggle<CR>' },
      { '<leader>xq', ':Trouble quickfix toggle<CR>' },
      { '<leader>xl', ':Trouble loclist toggle<CR>' },
      { 'gR',         ':Trouble lsp_references toggle<CR>' },
      { '<leader>xt', ':TodoTrouble<CR>' },
    },
    opts = {
      focus = true,
      modes = {
        lsp_references = {
          auto_refresh = false,
        },
        outline = {
          title = '{hl:Title}Outline',
          mode = 'lsp_document_symbols',
          focus = true,
          win = { position = 'right' },
          groups = {
            { 'filename', format = '{file_icon} {basename:Title} {count}' },
          },
          filter = {
            any = {
              kind = {
                'Class',
                'Constructor',
                'Enum',
                'Field',
                'Function',
                'Interface',
                'Method',
                'Module',
                'Namespace',
                'Struct',
                'Trait',
                'Variable',
              },
            },
          },
        },
      },
    },
  },
}
