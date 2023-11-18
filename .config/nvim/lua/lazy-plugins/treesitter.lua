return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- ensure_installed = 'all',
        -- ignore_install = { 'sql' },
        auto_install = true,
        highlight = {
          enable = true,
          disable = {'toml', 'lua', 'vim'},
        },
        -- indent = {
        --   enable = true,
        -- },
        autotag = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
    depends = {
      'RRethy/vim-illuminate',
      'windwp/nvim-ts-autotag',
      'romgrk/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'HiPhish/rainbow-delimiters.nvim',
        opts = function()
          local rainbow_delimiters = require('rainbow-delimiters')
          return {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                commonlisp = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            highlight = {
                'TSRainbowRed',    -- guifg=#bf616a
                'TSRainbowYellow', -- guifg=#ebcb8b
                'TSRainbowBlue',   -- guifg=#81a1c1
                'TSRainbowOrange', -- guifg=#c9826b
                'TSRainbowGreen',  -- guifg=#a3be8c
                'TSRainbowViolet', -- guifg=#b48ead
                'TSRainbowCyan',   -- guifg=#88c0d0
            },
            -- blacklist = {'c', 'cpp'},
          }
        end,
      },
    },
  },
}

