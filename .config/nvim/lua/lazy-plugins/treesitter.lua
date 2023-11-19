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
        endwise = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
    dependencies = {
      'RRethy/vim-illuminate',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'romgrk/nvim-treesitter-context',
        opts = { multiline_threshold = 1 },
      },
    },
  },
}

