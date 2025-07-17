return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'windwp/nvim-autopairs',
        event = 'BufEnter',
        opts = {},
      },
      {
        'hrsh7th/cmp-vsnip',
        dependencies = { 'hrsh7th/vim-vsnip' },
      },
      {
        'tzachar/cmp-fuzzy-buffer',
        dependencies = {
          {
            'tzachar/fuzzy.nvim',
            dependencies = {
              {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
              },
            },
          },
        },
      },
      {
        'zbirenbaum/copilot-cmp',
        dependencies = { 'zbirenbaum/copilot.lua' },
        config = function()
          require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
          })
          require('copilot_cmp').setup()
        end,
      },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            -- { name = 'nvim_lsp_signature_help' },
            { name = 'vsnip' },
          },
          {
            { name = 'fuzzy_buffer' },
          })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
          { name = 'fuzzy_buffer' },
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done', cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    event = { 'VeryLazy' },
    keys = {
      {
        '<leader>cp',
        function()
          require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions())
        end,
        mode = { 'n', 'v' },
        desc = 'CopilotChat - Prompt actions',
      },
    },
    opts = {
      -- model = 'claude-3.7-sonnet',
      -- model = 'gemini-2.0-flash-001',
      model = 'o3-mini',
      prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN 選択したコードの説明を日本語で段落をつけて書いてください。',
        },
        Review = {
          prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
          description = "コードのレビューをお願いする",
        },
        Fix = {
          prompt = '/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。',
        },
        Optimize = {
          prompt = '/COPILOT_OPTIMIZE 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。',
        },
        Docs = {
          prompt =
          '/COPILOT_DOCS 選択したコードのドキュメントを日本語で書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）',
        },
        Tests = {
          prompt = '/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を書いてください。',
        },
        FixDiagnostic = {
          prompt = '/COPILOT_FIXDIAGNOSTIC ファイル内の次のような診断上の問題を解決してください：',
        },
        Commit = {
          prompt = '/COPILOT_COMMIT この変更をコミットしてください。',
        },
        CommitStaged = {
          prompt = '/COPILOT_COMMITSTAGED ステージングされた変更をコミットしてください。',
        },
      },
    },
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- latest code changes
    -- version = '*', -- latest release version
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- optional,
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
    opts = {
      provider = 'copilot',
      -- cursor_applying_provier = 'copilot', -- nil なら provider の値を使用
      auto_suggestions_provider = 'claude',
      providers = {
        claude = {
          model = 'claude-3-5-sonnet-20241022',
        },
        copilot = {
          model = 'claude-sonnet-4',
          -- model = 'gemini-2.0-flash-001',
          -- model = 'o3-mini',
        },
        openai = {
          model = 'gpt-4o',
        },
      },
      behaviour = {
        auto_suggestions = false, -- copilot で有効にすると API の使用過多で BAN の可能性あり
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = true,
        enable_cursor_planning_mode = true,
        enable_claude_text_editor_tool_mode = true,
        use_cwd_as_project_root = true,
      },
      hints = {
        enabled = false,
      },
      file_selector = {
        provider = 'telescope',
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      image = { enabled = false },
      indent = { enabled = true },
      input = { enabled = false },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    event = 'VeryLazy',
    config = true,
    keys = {
      { "<leader>ai", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>ac", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                 desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
    },
  }
}
