return {
  {
    'echasnovski/mini.align',
    event = 'BufEnter',
    opts = {
      mappings = {
        start = '',
        start_with_preview = 'ga',
      },
    },
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { '<Leader>tj', ':TSJJoin<CR>' },
      { '<Leader>ts', ':TSJSplit<CR>' },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  {
    't9md/vim-textmanip',
    event = 'BufEnter',
    keys = {
      { '<C-j>', '<Plug>(textmanip-move-down)', mode = 'x' },
      { '<C-k>', '<Plug>(textmanip-move-up)', mode = 'x' },
      { '<C-h>', '<Plug>(textmanip-move-left)', mode = 'x' },
      { '<C-l>', '<Plug>(textmanip-move-right)', mode = 'x' },
    },
  },
  {
    'thinca/vim-qfreplace',
    event = 'BufEnter',
  },
  {
    'machakann/vim-sandwich',
    event = 'BufEnter',
  },
  {
    'terryma/vim-expand-region',
    event = 'BufEnter',
  },
  -- operator
  {
    'emonkak/vim-operator-sort',
    keys = {
      { 'S', '<Plug>(operator-sort)', mode = 'v' },
    },
    dependencies = { 'kana/vim-operator-user' },
  },
  {
    'kana/vim-operator-replace',
    keys = {
      { 'R', '<Plug>(operator-replace)', mode = '' }
    },
    dependencies = { 'kana/vim-operator-user' },
  },
  {
    'tyru/operator-camelize.vim',
    keys = {
      { '<leader>U', '<Plug>(operator-camelize)', mode = 'v' },
      { '<leader>u', '<Plug>(operator-decamelize)', mode = 'v' },
    },
    dependencies = { 'kana/vim-operator-user' },
  },
}
