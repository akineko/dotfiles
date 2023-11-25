return {
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
    'cshuaimin/ssr.nvim',
    keys = {
      { '<Leader>sr', function() require('ssr').open() end, mode = { 'n', 'x'} },
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
  {
    'sQVe/sort.nvim',
    cmd = 'Sort',
    opts = {},
  },
}
