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
    event = 'BufEnter',
    keys = {
      { '<leader>,', ':FuzzyMotion<CR>' },
    },
  },
}

