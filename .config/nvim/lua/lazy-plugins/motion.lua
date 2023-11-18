return {
  {
    'phaazon/hop.nvim',
    event = 'BufEnter',
    opts = {},
    keys = {
      { '<leader>m', ':HopWord<CR>' },
    },
  },
  {
    'easymotion/vim-easymotion',
    event = 'BufEnter',
  },
  {
    'yuki-yano/fuzzy-motion.vim',
    dependencies = { 'vim-denops/denops.vim' },
    event = 'BufEnter',
    keys = {
      { '<leader>,', ':FuzzyMotion<CR>' },
    },
  },
  {
    'unblevable/quick-scope',
    event = 'BufEnter',
    init = function()
      vim.g.qs_highlight_on_keys = {'f', 'F'}
      vim.cmd[[highlight QuickScopePrimary guifg=#2e3440 guibg=#81a1c1]]
      vim.cmd[[highlight QuickScopeSecondary guifg=#2e3440 guibg=#a3be8c]]
    end,
  },
}

