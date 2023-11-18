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
    'szw/vim-tags',
    event = 'BufEnter',
  },
  {
    'antoinemadec/FixCursorHold.nvim',
    event = 'BufEnter',
  },
  {
    'lambdalisue/glyph-palette.vim',
    event = 'BufEnter',
    dependencies = { 'lambdalisue/nerdfont.vim' },
  },
  {
    'lambdalisue/vim-findent',
    event = 'BufEnter',
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
            \	"*" : {
            \		"setfiletype" : 0
            \	},
            \	"help" : {
            \		"setfiletype" : 1
            \	},
            \	"toml" : {
            \		"setfiletype" : 1
            \	},
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
  -- {
  --   'mattn/webapi-vim',
  -- },
  -- {
  --   'osyo-manga/vim-anzu',
  --   hook_add = '''
  --   nmap n <Plug>(anzu-n-with-echo)
  --   nmap N <Plug>(anzu-N-with-echo)
  --   nmap * <Plug>(anzu-star-with-echo)
  --   nmap # <Plug>(anzu-sharp-with-echo)
  --   nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
  --
  --   " statusline
  --   if exists('*anzu#search_status')
  --     set statusline=%{anzu#search_status()}
  --   endif
  --   '''
  -- },
  -- {
  --   'junegunn/fzf.vim',
  --   dependencies = { 'junegunn/fzf' },
  --   hook_add = '''
  --   command! -bang -nargs=* Rg
  --     \ call fzf#vim#grep(
  --     \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  --     \   <bang>0 ? fzf#vim#with_preview('up:60%')
  --     \           : fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
  --     \   <bang>0)
  --
  --   function! s:find_git_root()
  --     return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  --   endfunction
  --   command! ProjectFiles execute 'Files' s:find_git_root()
  --
  --   function! s:build_quickfix_list(lines)
  --     call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  --     copen
  --     cc
  --   endfunction
  --
  --   let g:fzf_action = {
  --     \ 'ctrl-q': function('s:build_quickfix_list'),
  --     \ 'ctrl-t': 'tab split',
  --     \ 'ctrl-x': 'split',
  --     \ 'ctrl-v': 'vsplit' }
  --
  --   let $FZF_DEFAULT_OPTS = '--bind alt-a:select-all,alt-d:deselect-all'
  --
  --   " nnoremap [fzf] <Nop>
  --   " nmap <Leader>f [fzf]
  --   " nnoremap [fzf]f :<C-u>Files<CR>
  --   " nnoremap [fzf]b :<C-u>Buffers<CR>
  --   " nnoremap [fzf]t :<C-u>Tags<CR>
  --
  --   " nnoremap <silent> <C-p> :ProjectFiles<CR>
  --   " nnoremap <silent> <C-p> :GFiles<CR>
  --   '''
  -- },
