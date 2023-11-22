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
    'yuki-yano/fuzzy-motion.vim',
    dependencies = { 'vim-denops/denops.vim' },
    event = 'BufEnter',
    keys = {
      { '<leader>,', ':FuzzyMotion<CR>' },
    },
  },
  {
    'jinh0/eyeliner.nvim',
    event = 'VeryLazy',
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
}

