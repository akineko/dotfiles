return {
  {
    'jinh0/eyeliner.nvim',
    event = 'VeryLazy',
    opts = {
      highlight_on_key = true,
      dim = true,
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
          enabled = true,
        },
        char = {
          enabled = false,
          keys = { 'f', 'F' },
        },
      },
    },
    keys = {
      { "<leader>,", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}

