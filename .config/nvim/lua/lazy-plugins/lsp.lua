return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'ray-x/lsp_signature.nvim',
      'nvim-lua/lsp-status.nvim',
      -- TypeScript
      'yioneko/nvim-vtsls',
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      -- none-ls
      'nvim-lua/plenary.nvim',
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
      -- nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    event = 'VeryLazy',
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

      local on_attach = function (client, bufnr)
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

            local opts = { noremap=true, silent=true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TSLspOrganize<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

            on_attach(client, bufnr)
          end
        end

        if server_name == "vtsls" then
          opts.on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":VtsExec organize_imports<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":VtsExec add_missing_imports<CR>", opts)

            on_attach(client, bufnr)
          end
        end

        lspconfig[server_name].setup(opts)
      end})

      -- null-ls
      local null_ls = require('null-ls')

      require('mason-null-ls').setup({
        ensure_installed = {
          'bash-language-server',
        },
        automatic_installation = false,
        handlers = {},
      })

      null_ls.setup{
        debug = false,
        on_attach = on_attach,
        sources = {
          -- JavaScript / TypeScript
          null_ls.builtins.code_actions.xo.with({
              only_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.xo.with({
              only_local = "node_modules/.bin",
              method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
              timeout = 10000,
          }),
        },
      }
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
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'biome-check', 'dprint', { 'biome', 'prettierd', 'prettier' } },
          javascriptreact = { 'biome-check', 'dprint', { 'biome', 'prettierd', 'prettier' } },
          typescript = { 'biome-check', 'dprint', { 'biome', 'prettierd', 'prettier' } },
          typescriptreact = { 'biome-check', 'dprint', { 'biome', 'prettierd', 'prettier' } },
        },
        -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
      })
      -- NOTE: setup のオプションや args.buf を渡す形式だと dprint が動かない
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          require("conform").format({ timeout_ms = 500, lsp_fallback = true })
        end,
      })
    end,
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
