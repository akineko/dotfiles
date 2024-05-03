return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'folke/trouble.nvim',
      "folke/todo-comments.nvim",
      'debugloop/telescope-undo.nvim',
      'nvim-telescope/telescope-frecency.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      {
        'AckslD/nvim-neoclip.lua',
        opts = {
          keys = {
            telescope = {
              i = {
                paste = '<C-p>',
                paste_behind = '<C-S-p>',
                replay = '<C-r>',
                delete = '<Delete>',
                edit = '<C-e>',
              },
            },
          },
        },
      },
      {
        'ahmedkhalf/project.nvim',
        config = function()
          require('project_nvim').setup({
            manual_mode = true,
            show_hidden = true,
          })
        end,
      },
    },
    cmd = { 'Telescope' },
    keys = {
      { '[Telescope]', '' },
      { '<leader>f', '[Telescope]', remap = true },
      { '[Telescope]f', ':Telescope find_files<CR>' },
      { '[Telescope]F', ':Telescope find_files no_ignore=true<CR>' },
      { '[Telescope]g', ':Telescope live_grep<CR>' },
      { '[Telescope]b', ':Telescope buffers<CR>' },
      { '[Telescope]p', ':Telescope projects<CR>' },
      { '[Telescope]t', ':TodoTelescope<CR>' },
      { '[Telescope]u', ':Telescope undo<CR>' },
      { '[Telescope]y', ':Telescope neoclip<CR>' },
      -- lsp
      { 'gr', ':Telescope lsp_references<CR>' },
      { 'gd', ':Telescope lsp_definitions jump_type=never<CR>' },
      { '<leader>rf', ':Telescope lsp_references<CR>' },
      { '<leader>df', ':Telescope lsp_definitions jump_type=never<CR>' },
      { '<leader>ls', ':Telescope lsp_document_symbols<CR>' },
      { 'gw', ':Telescope lsp_dynamic_workspace_symbols<CR>' },
      { '<leader>td', ':Telescope lsp_type_definitions<CR>' },
      { '<leader>li', ':Telescope lsp_implementations<CR>' },
    },
    config = function()
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      local custom_actions = {}
      function custom_actions._multiopen(prompt_bufnr, open_cmd)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local num_selections = #picker:get_multi_selection()
        if not num_selections or num_selections <= 1 then
          actions.add_selection(prompt_bufnr)
        end
        actions.send_selected_to_qflist(prompt_bufnr)

        local results = vim.fn.getqflist()

        for _, result in ipairs(results) do
          local current_file = vim.fn.bufname()
          local next_file = vim.fn.bufname(result.bufnr)

          if current_file == "" then
            vim.api.nvim_command("edit" .. " " .. next_file)
          else
            vim.api.nvim_command(open_cmd .. " " .. next_file)
          end
        end

        vim.api.nvim_command("cd .")
      end
      function custom_actions.multi_selection_open_vsplit(prompt_bufnr)
          custom_actions._multiopen(prompt_bufnr, "vsplit")
      end
      function custom_actions.multi_selection_open_split(prompt_bufnr)
          custom_actions._multiopen(prompt_bufnr, "split")
      end
      function custom_actions.multi_selection_open_tab(prompt_bufnr)
          custom_actions._multiopen(prompt_bufnr, "tabe")
      end
      function custom_actions.multi_selection_open(prompt_bufnr)
          custom_actions._multiopen(prompt_bufnr, "edit")
      end

      local telescope_config = require('telescope.config')
      local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, '--hidden')
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/{.git,node_modules}/*')

      require('telescope').setup{
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
          mappings = {
            i = {
              ["<ESC>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-i>"] = actions.toggle_selection,
              ["<C-a>"] = actions.toggle_all,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-v>"] = custom_actions.multi_selection_open_vsplit,
              ["<C-x>"] = custom_actions.multi_selection_open_split,
              ["<C-t>"] = custom_actions.multi_selection_open_tab,
              ["<M-l>"] = actions.smart_send_to_loclist + actions.open_loclist,
              ["<M-o>"] = require('trouble.providers.telescope').smart_open_with_trouble,
            },
            n = i,
          },
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
            mappings = {
              ["i"] = {
                ['<Delete>'] = require('telescope._extensions.file_browser.actions').remove,
              },
              n = i,
            },
          },
          buffers = {
            mappings = {
              i = {
                ['<Delete>'] = actions.delete_buffer,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            -- theme = "ivy",
            hidden = true,
          },
          frecency = {
            db_safe_mode = false,
          },
        }
      }

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('frecency')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('neoclip')
      require('telescope').load_extension('projects')
      require("telescope").load_extension('undo')
    end,
  },
}
