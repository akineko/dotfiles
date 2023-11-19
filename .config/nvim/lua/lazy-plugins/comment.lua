return {
  {
    'numToStr/Comment.nvim',
    event = 'BufEnter',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = function()
      return {
        toggler = {
          line = '<leader>cc',
          block = '<leader>cb',
        },
        opleader = {
          line = '<leader>cc',
          block = '<leader>cb',
        },
        mappings = {
          extra = false,
        },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-treesitter/nvim-treesitter',
    },
    cmd = { 'TodoQuickFix', 'TodoLocList', 'TodoTrouble', 'TodoTelescope' },
    opts = {},
  },
}
