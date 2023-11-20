return {
  {
    'kana/vim-submode',
    event = 'BufEnter',
    config = function()
      -- window
      vim.fn['submode#enter_with']('winsize', 'n', 's', '<C-w>>', '<C-w>>')
      vim.fn['submode#enter_with']('winsize', 'n', 's', '<C-w><', '<C-w><')
      vim.fn['submode#enter_with']('winsize', 'n', 's', '<C-w>+', '<C-w>+')
      vim.fn['submode#enter_with']('winsize', 'n', 's', '<C-w>-', '<C-w>-')
      vim.fn['submode#map']('winsize', 'n', 's', '>', '<C-w>>')
      vim.fn['submode#map']('winsize', 'n', 's', '<', '<C-w><')
      vim.fn['submode#map']('winsize', 'n', 's', '+', '<C-w>+')
      vim.fn['submode#map']('winsize', 'n', 's', '-', '<C-w>-')
      -- tab
      vim.fn['submode#enter_with']('movetab', 'n', 's', '<C-t>l', ':<C-u>+tabmove<CR>')
      vim.fn['submode#enter_with']('movetab', 'n', 's', '<C-t>h', ':<C-u>-tabmove<CR>')
      vim.fn['submode#map']('movetab', 'n', 's', 'l', ':<C-u>+tabmove<CR>')
      vim.fn['submode#map']('movetab', 'n', 's', 'h', ':<C-u>-tabmove<CR>')
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Leader>ss', [[:lua require('spectre').toggle()<CR>]], desc = 'Toggle Spectre' },
      { '<Leader>sw', [[:lua require('spectre').open_visual({select_word=true})<CR>]], desc = 'Search current word' },
      { '<Leader>sw', [[<esc>:lua require('spectre').open_visual()<CR>]], mode = 'v', desc = 'Search current word' },
    },
    opts = {},
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = { '<A-t>' },
    opts = {
      open_mapping = '<A-t>',
      direction = 'float',
    },
  },
  {
    'deris/vim-rengbang',
    cmd = { 'RengBang', 'RengBangConfirm' },
  },
}
