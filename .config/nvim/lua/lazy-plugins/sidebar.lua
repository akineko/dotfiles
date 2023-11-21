return {
  {
    'nvim-tree/nvim-tree.lua',
    event = 'BufEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    keys = {
      { '<F2>', ':NvimTreeToggle<CR>' },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      local api = require('nvim-tree.api')

      local function on_attach(bufnr)
        local function opts(desc)
          return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', '<C-y>', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      end

      require('nvim-tree').setup {
        on_attach = on_attach,
        git = {
          ignore = false,
        },
        update_focused_file = {
          enable = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
            -- window_picker = {
            --   enable = false,
            -- },
          },
        },
      }
    end,
  },
  {
    'stevearc/aerial.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    event = 'BufEnter',
    keys = {
      { '<F3>', ':AerialToggle right<CR>' },
      { '<leader>lo',  ':AerialToggle right<CR>' },
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      filter_kind = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Method',
        'Module',
        'Struct',
        'Variable',
      },
      autojump = true,
      close_on_select = true,
      close_automatic_events = { 'unfocus', 'switch_buffer', 'unsupported' },
    },
  }
}

