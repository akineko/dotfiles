return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    config = function()
      local function file_encoding()
          return ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc)
      end

      local function lsp_client_names()
          local clients = {}

          for _, client in pairs(vim.lsp.buf_get_clients(0)) do
              clients[#clients + 1] = client.name
          end

          return table.concat(clients, ' ')
      end

      require("lualine").setup {
        options = {
          theme = 'wombat',
          globalstatus = true,
        },
        sections = {
          lualine_b = {
            'branch',
            'diff',
            {'diagnostics', sources = {'nvim_diagnostic'}},
          },
          lualine_c = {
            {'filename', path = 1},
          },
          lualine_x = {
            -- {
            --   lsp_client_names,
            --   icon = ' LSP:',
            -- },
            file_encoding,
            'fileformat',
            'filetype',
          }
        },
        inactive_sections = {
          lualine_c = {
            {'filename', path = 1, shorting_target = 20}
          }
        },
        tabline = {
          lualine_a = {
            {'tabs', max_length = vim.o.columns, mode = 2}
          },
        },
      }
    end,
  },
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
}
