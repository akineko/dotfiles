return {
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
    'anuvyklack/hydra.nvim',
    event = 'VeryLazy',
    config = function()
      local hydra = require('hydra')
      hydra({
        name = 'Tab',
        config = {
          invoke_on_body = true,
          timeout = true,
          color = 'pink',
        },
        body = '<C-t>',
        heads = {
          { "n", ":tabnew<CR>", { exit = true } },
          { "c", ":tabclose<CR>" },
          { "h", ":-tabmove<CR>" },
          { "l", ":+tabmove<CR>" },
          { "j", ":tabnext<CR>" },
          { "k", ":tabprevious<CR>" },
        },
      })
      hydra({
        name = 'Window',
        config = {
          invoke_on_body = true,
          timeout = true,
          color = 'pink',
        },
        body = '<C-w>',
        heads = {
          { "h", "<C-w>h" },
          { "j", "<C-w>j" },
          { "l", "<C-w>l" },
          { "k", "<C-w>k" },
          { "<", "<C-w><" },
          { ">", "<C-w>>" },
          { "+", "<C-w>+" },
          { "-", "<C-w>-" },
        },
      })
    end,
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
