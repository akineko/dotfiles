return {
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
          enabled = true,
          keys = { 'f', 'F' },
          multi_line = false,
          jump_labels = true,
          jump = { autojump = true },
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
