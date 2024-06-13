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
    },
  },
}
