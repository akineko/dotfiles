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
    },
  },
}

