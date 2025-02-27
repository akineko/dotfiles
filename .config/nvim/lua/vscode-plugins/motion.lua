return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
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
