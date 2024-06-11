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
      { '<C-j>', '<Plug>(textmanip-move-down)',  mode = 'x' },
      { '<C-k>', '<Plug>(textmanip-move-up)',    mode = 'x' },
      { '<C-h>', '<Plug>(textmanip-move-left)',  mode = 'x' },
      { '<C-l>', '<Plug>(textmanip-move-right)', mode = 'x' },
    },
  },
  {
    'monaqa/dial.nvim',
    keys = {
      {
        '<C-a>',
        function() require('dial.map').manipulate('increment', 'normal') end,
      },
      {
        '<C-x>',
        function() require("dial.map").manipulate('decrement', 'normal') end,
      },
      {
        '<C-a>',
        function() require("dial.map").manipulate('increment', 'visual') end,
        mode = 'v',
      },
      {
        '<C-x>',
        function() require('dial.map').manipulate('decrement', 'visual') end,
        mode = 'v',
      },
    },
    config = function()
      local augend = require("dial.augend")
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.date.alias['%Y/%m/%d'],
          augend.date.alias['%Y-%m-%d'],
          augend.date.alias['%m/%d'],
          augend.date.alias['%H:%M'],
          augend.constant.alias.de_weekday_full,
          augend.constant.alias.ja_weekday,
          augend.semver.alias.semver,
        },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
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
      { '<leader>U', '<Plug>(operator-camelize)',   mode = 'v' },
      { '<leader>u', '<Plug>(operator-decamelize)', mode = 'v' },
    },
    dependencies = { 'kana/vim-operator-user' },
  },
}
