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
    "folke/sidekick.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    event = 'VeryLazy',
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          enabled = false,
          backend = "tmux",
          create = "split", -- "terminal" | "window" | "split"
          split = {
            size = 0.3,
          },
        },
      },
    },
    keys = {
      -- {
      --   "<tab>",
      --   function()
      --     -- if there is a next edit, jump to it, otherwise apply it if any
      --     if not require("sidekick").nes_jump_or_apply() then
      --       return "<Tab>" -- fallback to normal tab
      --     end
      --   end,
      --   expr = true,
      --   desc = "Goto/Apply Next Edit Suggestion",
      -- },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ac",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  }
}
