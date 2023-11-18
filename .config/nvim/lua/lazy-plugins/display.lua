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
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    main = 'rainbow-delimiters.setup',
    opts = function()
      local rainbow_delimiters = require('rainbow-delimiters')
      return {
        highlight = {
            'TSRainbowRed',    -- guifg=#bf616a
            'TSRainbowYellow', -- guifg=#ebcb8b
            'TSRainbowBlue',   -- guifg=#81a1c1
            'TSRainbowOrange', -- guifg=#c9826b
            'TSRainbowGreen',  -- guifg=#a3be8c
            'TSRainbowViolet', -- guifg=#b48ead
            'TSRainbowCyan',   -- guifg=#88c0d0
        },
      }
    end,
  },
}
