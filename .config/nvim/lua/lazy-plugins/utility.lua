return {
  {
    'vim-denops/denops.vim'
  },
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
}
