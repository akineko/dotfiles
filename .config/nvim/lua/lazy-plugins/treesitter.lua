return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
      },
      {
        'RRethy/vim-illuminate',
        opts = {
          providers = { 'lsp', 'regex' },
        },
        config = function(_, opts)
          require('illuminate').configure(opts)
        end,
      },
      'RRethy/nvim-treesitter-endwise',
      {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = function()
          require('nvim-ts-autotag').setup({
            opts = {
              enable_close_on_slash = true,
            }
          })
        end
      },
      'JoosepAlviste/nvim-ts-context-commentstring',
      {
        'romgrk/nvim-treesitter-context',
        opts = { multiline_threshold = 1 },
      },
    },
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true

      require('nvim-treesitter').setup({
        auto_install = true,
      })

      -- textobjects
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      })

      -- textobjects: select keymaps
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end)

      -- textobjects: swap keymaps
      vim.keymap.set("n", "<leader>ta", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end)
      vim.keymap.set("n", "<leader>tA", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
      end)
    end,
  },
  {
    'mfussenegger/nvim-treehopper',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]] },
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]], mode = 'x' },
      { 'm', [[:<C-u>lua require('tsht').nodes()<CR>]], mode = 'o', remap = true },
    },
  },
}
