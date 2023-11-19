return {
  {
    'Shougo/vimproc.vim',
    build = 'make',
  },
  {
    'vim-jp/vimdoc-ja',
    event = 'BufEnter',
  },
  {
    'kyazdani42/nvim-web-devicons',
    event = 'BufEnter',
  },
  {
    'folke/lsp-colors.nvim',
    event = 'BufEnter',
  },
-- utility
  {
    'thinca/vim-quickrun',
    event = 'BufEnter',
    keys = {
      { '<leader>r', ':QuickRun<CR>', silent = true },
    },
    init = function()
      vim.g.quickrun_config = {
        cpp = {
            cmdopt = '-Wall -std=c++17',
        },
      }
    end,
  },
  {
    'vim-scripts/AnsiEsc.vim',
    event = 'BufEnter',
  },
  {
    'dhruvasagar/vim-table-mode',
    keys = {
      { '<Space>tm', ':TableModeEnable<CR>' },
      { '<Space>tt', ':Tableize<CR>' },
    },
    init = function()
      vim.g.table_mode_disable_mappings = 1
      vim.g.table_mode_disable_tableize_mappings = 1
      vim.g.table_mode_map_prefix = ''
      vim.g.table_mode_toggle_map = ''
    end,
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { '[fugitive]', '' },
      { '<Space>g', '[fugitive]', remap = true },
      { '[fugitive]s', ':Git status<CR><C-w>T', silent = true },
      { '[fugitive]b', ':Git blame<CR>', silent = true },
      { '[fugitive]d', ':Git diff<CR>', silent = true },
      { '[fugitive]m', ':Git merge<CR>', silent = true },
      { '[fugitive]i', ':Git rebase<CR>', silent = true },
    },
  },
  {
    'dhruvasagar/vim-zoom',
    keys = {
      { '<C-w>o', '<Plug>(zoom-toggle)' },
    },
  },
  {
    'xolox/vim-session',
    event = 'BufEnter',
    dependencies = { 'xolox/vim-misc' },
    init = function()
      vim.g.session_lock_enabled = 0
      vim.g.session_autoload = 'no'
      vim.g.session_autosave = 'yes'
      vim.g.session_autosave_periodic = 5
      vim.g.session_autosave_silent = 1
      vim.g.session_persist_font = 0
      vim.g.session_persist_colors = 0
    end,
  },
  {
    'osyo-manga/vim-precious',
    event = 'BufEnter',
    dependencies = { 'Shougo/context_filetype.vim' },
    init = function()
      vim.cmd([[
        let g:precious_enable_switchers = {
            \ "*" : {
            \   "setfiletype" : 0
            \ },
            \ "help" : {
            \   "setfiletype" : 1
            \ },
            \ "toml" : {
            \   "setfiletype" : 1
            \ },
            \}
      ]])
    end,
  },
  {
    'junegunn/fzf',
    build = ':call fzf#install()',
    event = 'BufEnter',
  },
}
