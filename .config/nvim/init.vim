if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = expand('$XDG_CONFIG_HOME/nvim/dein.toml')
  call dein#load_toml(s:toml, {'lazy' : 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" encoding
set encoding=utf-8
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
augroup InsertHock
    autocmd!
    autocmd InsertEnter * highlight StatusLine term=bold cterm=bold ctermfg=7 ctermbg=4
    autocmd InsertLeave * highlight StatusLine term=bold cterm=bold ctermfg=4 ctermbg=7
augroup END

" ----- keymap -----
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

