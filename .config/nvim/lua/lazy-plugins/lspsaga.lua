return {
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'BufEnter',
    keys = {
      { 'K',           ':Lspsaga hover_doc<CR>' },
      { '<leader>rn',  ':Lspsaga rename<CR>' },
      { 'gf',          ':Lspsaga finder<CR>' },
      { 'gD',          ':Lspsaga peek_definition<CR>' },
      { 'ge',          ':Lspsaga show_line_diagnostics<CR>' },
      { '<leader>lk',  ':Lspsaga diagnostic_jump_prev<CR>' },
      { '<leader>lj',  ':Lspsaga diagnostic_jump_next<CR>' },
      { '<leader>lca', ':Lspsaga code_action<CR>' },
      { '<leader>lca', ':Lspsaga code_action<CR>', mode = 'v' },
    },
    opts = {
      code_action = {
        show_server_name = true,
      },
      lightbulb = {
        sign = true,
        virtual_text = true,
        debounce = 1000,
      },
      symbol_in_winbar = {
        enable = false,
      },
    },
  },
}

