return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Show which-key' },
    },
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
          { "n", ":tabnew<CR>",     { exit = true } },
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
          { "H", "<C-w>H", { exit = true } },
          { "J", "<C-w>J", { exit = true } },
          { "K", "<C-w>K", { exit = true } },
          { "L", "<C-w>L", { exit = true } },
          { "<", "<C-w><" },
          { ">", "<C-w>>" },
          { "+", "<C-w>+" },
          { "-", "<C-w>-" },
          { "=", "<C-w>=", { exit = true } },
        },
      })
    end,
  },
}
