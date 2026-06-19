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
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true

      require('nvim-treesitter').setup() -- 受け付けるのは install_dir のみ。既定でOK

      -- main ブランチはハイライトを自前で start する必要がある。
      -- さらに auto_install が無いので「未導入なら入れてから start」を自作する。
      -- 折りたたみは nvim-ufo が管理するためここでは触らない。
      local ts = require('nvim-treesitter')
      local function ts_enable(buf)
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang then return end
        if pcall(vim.treesitter.start, buf, lang) then return end -- バンドル済み/導入済みは即start
        if vim.tbl_contains(ts.get_available(), lang) then        -- 未導入なら非同期install後にstart
          ts.install(lang):await(function()
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(buf) then
                pcall(vim.treesitter.start, buf, lang)
              end
            end)
          end)
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args) ts_enable(args.buf) end,
      })
      ts_enable(vim.api.nvim_get_current_buf()) -- 遅延ロードを誘発した最初のバッファを取りこぼさない

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
