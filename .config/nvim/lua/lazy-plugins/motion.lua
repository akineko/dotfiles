return {
  {
    'jinh0/eyeliner.nvim',
    event = 'VeryLazy',
    keys = {
      { 'f', function() require('eyeliner').highlight({ forward = true }) end },
      { 'F', function() require('eyeliner').highlight({ forward = false }) end },
    },
    opts = {
      highlight_on_key = true,
      dim = true,
      default_keymaps = false,
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      highlight = {
        groups = {
          match = 'String',
          label = 'Number',
        },
      },
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
          keys = { 'f', 'F' },
        },
      },
    },
    keys = {
      { "<leader>,", mode = { "n" }, function() require("flash").jump() end,   desc = "Flash" },
      { "r",         mode = "o",     function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>",     mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}
