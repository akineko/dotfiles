return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'ray-x/lsp_signature.nvim',
      'nvim-lua/lsp-status.nvim',
      'nvim-lua/plenary.nvim',
      -- TypeScript
      'yioneko/nvim-vtsls',
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      -- nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    event = 'VeryLazy',
    keys = {
      { 'ge',         [[:lua vim.diagnostic.open_float({ scope = 'cursor', border = 'rounded' })<CR>]] },
      { '<leader>lk', ':lua vim.diagnostic.goto_prev()<CR>' },
      { '<leader>lj', ':lua vim.diagnostic.goto_next()<CR>' },
    },
    config = function()
      require("mason").setup()

      local ok, _ = pcall(require, 'cmp')
      local capabilities
      if ok then
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
        capabilities.textDocument.completion.completionItem.deprecatedSupport = true
        capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
        capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
        capabilities.textDocument.completion.completionItem.preselectSupport = true
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
        capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
          }
        }
      end

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        require "lsp_signature".on_attach()
      end

      local lspconfig = require("lspconfig")
      lspconfig.configs.vtsls = require("vtsls").lspconfig

      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({ function(server_name)
        local opts = {}
        opts.on_attach = on_attach
        opts.capabilities = capabilities

        if server_name == "tsserver" then
          opts.on_attach = function(client, bufnr)
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({
              enable_import_on_completion = true,
              always_organize_imports = true,
            })
            ts_utils.setup_client(client)

            local opts = { noremap = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TSLspOrganize<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

            on_attach(client, bufnr)
          end
        end

        if server_name == "vtsls" then
          opts.on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":VtsExec organize_imports<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":VtsExec add_missing_imports<CR>", opts)

            on_attach(client, bufnr)
          end
        end

        lspconfig[server_name].setup(opts)
      end })
    end,
  },
  {
    'stevearc/conform.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        [[:lua require("conform").format({ async = true, lsp_fallback = true })<CR>]],
        desc = 'Format buffer',
      },
    },
    config = function()
      local function first(bufnr, ...)
        local conform = require("conform")
        for i = 1, select("#", ...) do
          local formatter = select(i, ...)
          if conform.get_formatter_info(formatter, bufnr).available then
            return formatter
          end
        end
        return select(1, ...)
      end

      local function js_formatters(bufnr)
        return { 'biome-organize-imports', 'biome-check', first(bufnr, 'biome', 'dprint', 'prettierd', 'prettier') }
      end

      require('conform').setup({
        format_on_save = {
          lsp_format = 'fallback',
          timeout_ms = 500,
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = js_formatters,
          javascriptreact = js_formatters,
          typescript = js_formatters,
          typescriptreact = js_formatters,
          terraform = { lsp_format = 'fallback' },
        },
      })
    end,
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'mfussenegger/nvim-lint',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { 'biomejs', 'eslint' },
        javascriptreact = { 'biomejs', 'eslint' },
        typescript = { 'biomejs', 'eslint' },
        typescriptreact = { 'biomejs', 'eslint' },
        terraform = { 'tflint' },
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          lint.try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    event = 'VeryLazy',
    keys = {
      { 'zR', ':lua require("ufo").openAllFolds()<CR>',  desc = 'Open all folds' },
      { 'zM', ':lua require("ufo").closeAllFolds()<CR>', desc = 'Close all folds' },
    },
    config = function()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup()
    end,
  },
  {
    "saecki/live-rename.nvim",
    event = "LspAttach",
    keys = {
      { '<leader>rn', function() require('live-rename').rename() end },
    },
    opts = {},
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      'prochri/telescope-all-recent.nvim',
    },
    event = "LspAttach",
    keys = {
      { '<leader>lca', function() require('tiny-code-action').code_action() end, mode = { 'n', 'v' } },
    },
    opts = {},
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    init = function()
      vim.diagnostic.config({ virtual_text = false })
    end,
    opts = {
      preset = 'ghost',
      options = {
        multilines = {
          enabled = true,
          always_show = false,
        },
      },
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- "nvim-telescope/telescope.nvim",
      'prochri/telescope-all-recent.nvim',
      "neovim/nvim-lspconfig",
    },
    event = "LspAttach",
    opts = {} -- your configuration
  },
}
