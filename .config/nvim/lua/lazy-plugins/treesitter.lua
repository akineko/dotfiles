return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/vim-illuminate',
      'RRethy/nvim-treesitter-endwise',
      {
        'windwp/nvim-ts-autotag',
        opts = { enable_close_on_slash = true },
      },
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'romgrk/nvim-treesitter-context',
        opts = { multiline_threshold = 1 },
      },
    },
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true

      require('nvim-treesitter.configs').setup({
        -- ensure_installed = 'all',
        ignore_install = { 'dockerfile' },
        auto_install = true,
        highlight = {
          enable = true,
          disable = { 'toml', 'lua', 'vim' },
        },
        -- indent = {
        --   enable = true,
        -- },
        endwise = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>ta"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>tA"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
  {
    'mfussenegger/nvim-treehopper',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]] },
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]], mode = 'x' },
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]], mode = 'o', remap = true },
    },
  },
}
