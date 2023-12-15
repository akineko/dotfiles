return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'SmiteshP/nvim-navic',
      'ray-x/lsp_signature.nvim',
      'nvim-lua/lsp-status.nvim',
      'lukas-reineke/lsp-format.nvim',
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
      require('lsp-format').setup{
        typescript = {
          order = { 'tsserver', 'vtsls', 'null-ls' },
        }
      }

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
        vim.keymap.set('n', '<leader>lf', ":lua vim.lsp.buf.format{ async = true }<CR>", opts)

        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').on_attach(client, bufnr)
        end

        require "lsp_signature".on_attach()
        require('lsp-format').on_attach(client)
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

      local function find_root()
        local node_root = lspconfig.util.find_package_json_ancestor()
        if node_root ~= "" then
          return node_root
        end

        local modules_root = lspconfig.util.find_node_modules_ancestor()
        if modules_root ~= "" then
          return modules_root
        end

        return lspconfig.util.find_git_ancestor()
      end

      require('mason-null-ls').setup({
        ensure_installed = {
          'shellcheck',
        },
        automatic_installation = false,
        handlers = {
          shellcheck = function(source_name, methods)
            null_ls.register(null_ls.builtins.code_actions.shellcheck.with({ disabled_filetypes = { 'conf' } }))
            null_ls.register(null_ls.builtins.diagnostics.shellcheck.with({ disabled_filetypes = { 'conf' } }))
          end,
        },
      })

      null_ls.setup{
        debug = false,
        on_attach = on_attach,
        -- root_dir = find_root,
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
}

