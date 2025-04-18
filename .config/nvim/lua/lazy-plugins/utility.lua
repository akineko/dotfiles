return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<Leader>ss', [[:lua require('spectre').toggle()<CR>]],                        desc = 'Toggle Spectre' },
      { '<Leader>sw', [[:lua require('spectre').open_visual({select_word=true})<CR>]], desc = 'Search current word' },
      { '<Leader>sw', [[<esc>:lua require('spectre').open_visual()<CR>]],              mode = 'v',                  desc = 'Search current word' },
    },
    opts = {},
  },
  {
    'cshuaimin/ssr.nvim',
    keys = {
      { '<Leader>sr', function() require('ssr').open() end, mode = { 'n', 'x' } },
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
  {
    'kevinhwang91/nvim-bqf',
    dependencies = {
      'junegunn/fzf',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = 'qf',
    opts = {
      func_map = {
        prevfile = '<C-k>',
        nextfile = '<C-j>',
        stoggleup = '',
        stoggledown = '',
        stogglevm = '<C-i>',
        stogglebuf = '<C-i>',
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { '<Leader>ha', function() require("harpoon"):list():add() end,     desc = "Add file to harpoon" },
      {
        '<Leader>hl',
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Open harpoon menu"
      },
      { '<Leader>h1', function() require("harpoon"):list():select(1) end, desc = "Navigate to file 1" },
      { '<Leader>h2', function() require("harpoon"):list():select(2) end, desc = "Navigate to file 2" },
      { '<Leader>h3', function() require("harpoon"):list():select(3) end, desc = "Navigate to file 3" },
      { '<Leader>h4', function() require("harpoon"):list():select(4) end, desc = "Navigate to file 4" },
      { '<Leader>hn', function() require("harpoon"):list():next() end,    desc = "Toggle next buffers" },
      { '<Leader>hp', function() require("harpoon"):list():prev() end,    desc = "Toggle prev buffers" },
    },
    opts = {},
  },
}
