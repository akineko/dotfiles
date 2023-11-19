return {
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      "folke/todo-comments.nvim",
    },
    event = 'BufEnter',
    keys = {
      { '<leader>xx', ':TroubleToggle<CR>' },
      { '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>' },
      { '<leader>xd', ':TroubleToggle document_diagnostics<CR>' },
      { '<leader>xq', ':TroubleToggle quickfix<CR>' },
      { '<leader>xl', ':TroubleToggle loclist<CR>' },
      { 'gR',         ':TroubleToggle lsp_references<CR>' },
      { '<leader>xt', ':TodoTrouble<CR>' },
    },
    opts = {},
  },
}

