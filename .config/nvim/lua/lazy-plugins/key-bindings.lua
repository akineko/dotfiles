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
}
