return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    opts = {},
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'BufEnter',
    dependencies = { 'nvim-treesitter/nvim-treesitter', },
    main = 'rainbow-delimiters.setup',
    opts = {
      highlight = {
        'TSRainbowRed',    -- guifg=#bf616a
        'TSRainbowYellow', -- guifg=#ebcb8b
        'TSRainbowBlue',   -- guifg=#81a1c1
        'TSRainbowOrange', -- guifg=#c9826b
        'TSRainbowGreen',  -- guifg=#a3be8c
        'TSRainbowViolet', -- guifg=#b48ead
        'TSRainbowCyan',   -- guifg=#88c0d0
      }
    },
  },
  {
  "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        line_num = {
          style = '#81a1c1',
        },
        chunk = {
          style = '#81a1c1',
        },
      })
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'kevinhwang91/nvim-hlslens',
    },
    event = 'BufEnter',
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.gitsigns').setup()
      require('scrollbar.handlers.search').setup({
        override_lens = function() end,
      })
    end,
  },
}

