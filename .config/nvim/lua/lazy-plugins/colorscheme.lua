return {
  -- treesitter colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/edge",
  },
  {
    "bluz71/vim-moonfly-colors",
  },
  {
    "kaiuri/nvim-juliana",
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "rakr/vim-one",
  },
  {
    "rmehri01/onenord.nvim",
  },
  -- colorscheme
  {
    "cocopon/iceberg.vim",
  },
  {
    "w0ng/vim-hybrid",
  },
  {
    "nightsense/snow",
  },
  {
    "joshdick/onedark.vim",
  },
  {
    "aereal/vim-colors-japanesque",
  },
}
