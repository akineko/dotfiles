if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = expand('$XDG_CONFIG_HOME/nvim/dein.toml')
  let s:lazy_toml = expand('$XDG_CONFIG_HOME/nvim/deinlazy.toml')
  call dein#load_toml(s:toml, {'lazy' : 0})
  call dein#load_toml(s:lazy_toml, {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" set termguicolors

colorscheme hybrid
set background=dark

" encoding
if !has('nvim')
  set encoding=utf-8
endif
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,utf-8,euc-jp,cp932

" fileformat
set fileformat=unix
set fileformats=unix,dos,mac

" 行番号
set number

" カーソル位置のハイライト
set cursorline
set nocursorcolumn

" スクロールのマージ
set scrolloff=5

" swap&backup
set noswapfile
set nobackup
set writebackup

" インデント関係
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set shiftround

" splitの表示位置を下に
set splitbelow
" vsplitの表示位置を右に
set splitright

" modeline
set modeline

" ---- search -----
" 小文字での検索時に大文字小文字を区別しない
set ignorecase
" 大文字がある場合のみ大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索結果をハイライト
set hlsearch
" 検索のループ
set wrapscan
" 補完の際の大文字小文字の区別しない ignorecaseとsmartcaseに依存
set infercase

" ファイル更新の自動読み込み
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" 編集を保持したまま別ファイルへ
set hidden

" 不可視文字の表示
" tab:最初２文字 trail:行末の空白 extends:折り返しの行末 precedes:折り返しの行頭 eol:行末
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<

" コマンドラインの行数
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" コマンドの記録数
set history=100

" ステータスラインに文字コードと改行文字を表示
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%l/%L]

" インサートモードでステータスラインのカラーを変更
" augroup InsertHock
"     autocmd!
"     autocmd InsertEnter * highlight StatusLine term=bold cterm=bold ctermfg=234 ctermbg=110
"     autocmd InsertLeave * highlight StatusLine term=bold cterm=reverse ctermfg=245 ctermbg=234
" augroup END

" ----- keymap -----
let mapleader = ","

" : と ; の入れ替え
noremap ; :
noremap : ;

" 検索ハイライトの非表示
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" init.vim の編集
nnoremap <Space>. :<C-u>edit $XDG_CONFIG_HOME/nvim/init.vim<CR>
nnoremap <Space>.l :<C-u>source $XDG_CONFIG_HOME/nvim/init.vim<CR>

" 選択した文字列の検索/置換
vnoremap <silent> // y/<C-r>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap /r y:%S/<C-r>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" ウィンドウ操作
nnoremap    <Space>h    <C-w>h
nnoremap    <Space>j    <C-w>j
nnoremap    <Space>l    <C-w>l
nnoremap    <Space>k    <C-w>k
nnoremap    <Space>H    <C-w>H
nnoremap    <Space>J    <C-w>J
nnoremap    <Space>K    <C-w>K
nnoremap    <Space>L    <C-w>L
nnoremap    <Space><    <C-w><
nnoremap    <Space>>    <C-w>>
nnoremap    <Space>+    <C-w>+
nnoremap    <Space>-    <C-w>-

" タブ操作
nnoremap    [Tab]               <Nop>
nmap        <C-t>               [Tab]
nnoremap    <silent> [Tab]n     :<C-u>tabnew<CR>
nnoremap    <silent> [Tab]c     :<C-u>tabclose<CR>
nnoremap    [Tab]j              gt
nnoremap    [Tab]k              gT
nnoremap    <Tab>     gt
nnoremap    <S-Tab>     gT
nnoremap    <C-Tab>     gt
nnoremap    <C-S-Tab>   gT

" タグジャンプ操作
nnoremap    [Tag]               <Nop>
nmap        t                   [Tag]
nnoremap    [Tag]t              <C-]>
nnoremap    <silent> [Tag]j     :<C-u>tag<CR>
nnoremap    <silent> [Tag]k     :<C-u>pop<CR>
nnoremap    <silent> [Tag]l     :<C-u>tags<CR>

" insert mode でのカーソル移動
inoremap    <M-k>       <Up>
inoremap    <M-j>       <Down>
inoremap    <M-h>       <Left>
inoremap    <M-l>       <Right>

" C++用(これはfiletypeがC++ならに変える)
nnoremap <silent> sh :<C-u>hide edit %<.h<CR>
nnoremap <silent> ss :<C-u>hide edit %<.cpp<CR>

" textmanip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" Vaffle
let g:vaffle_show_hidden_files = 0
let g:vaffle_auto_cd = 0
nnoremap <Leader>f :<C-u>Vaffle<CR>

" Python3 plug
" let g:python3_host_prog = '/usr/bin/python3'

" VimFiler
nnoremap <F2> :VimFiler -split -simple -winwidth=35 -no-quit -toggle<CR>
augroup vimfiler
  autocmd!
  autocmd FileType vimfiler call s:vimfiler_settings()
augroup END
function! s:vimfiler_settings()
  nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')
endfunction

" tagbar
nnoremap <Leader>t :<C-u>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" Unite
nnoremap [Unite] <Nop>
nmap <Space>u [Unite]
nnoremap <silent> [Unite]f :<C-u>Unite -no-split file<CR>
nnoremap <silent> [Unite]m :<C-u>Unite -no-split file_mru<CR>
nnoremap <silent> [Unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [Unite]b :<C-u>Unite -no-split buffer<CR>
nnoremap <silent> [Unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [Unite]o :<C-u>Unite -vertical -winwidth=30 outline<CR>
nnoremap <silent> [Unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [Unite]jl :<C-u>Unite junkfile<CR>
nnoremap <silent> [Unite]jn :<C-u>Unite -start-insert junkfile/new junkfile<CR>

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_def_mapping_enabled = 0
let g:go_highlight_operators = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 0
let g:go_term_enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

" deoplete-go
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" neomake go
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet', 'errcheck']

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
nnoremap <C-p> :<C-u>CtrlP<CR>
let g:ctrlp_user_command = 'files -a %s'
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" caw
nmap <Leader>c <Plug>(caw:prefix)
xmap <Leader>c <Plug>(caw:prefix)

