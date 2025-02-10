return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    event = 'BufEnter',
    opts = {
      attach_navic = false,
      show_modified = true,
    },
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        line_num = {
          enable = true,
          style = '#81a1c1',
        },
        chunk = {
          enable = true,
          style = '#81a1c1',
        },
      })
    end,
  },
}
