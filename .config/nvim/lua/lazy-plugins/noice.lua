return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
        },
        notify = {
          replace = true,
          merge = false,
        },
      },
      lsp = {
        signature = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            -- find = "written",
          },
          opts = { skip = true },
        },
      },
    }
  },
}
