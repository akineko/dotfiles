if &compatible
  set nocompatible
endif

let mapleader = ","
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
  let s:ddc_toml = expand('$XDG_CONFIG_HOME/nvim/ddc.toml')
  let s:nvimcmp_toml = expand('$XDG_CONFIG_HOME/nvim/nvim-cmp.toml')

  call dein#load_toml(s:toml, {'lazy' : 0})
  call dein#load_toml(s:lazy_toml, {'lazy' : 1})
  " call dein#load_toml(s:ddc_toml, {'lazy' : 1})
  call dein#load_toml(s:nvimcmp_toml, {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

command! -nargs=0 DeinUpdate :call dein#update()
command! -nargs=0 DeinClean :call s:deinClean()

function! s:deinClean()
  call map(dein#check_clean(), 'delete(v:val, "rf")')
  call dein#recache_runtimepath()
endfunction

" if !has('vim_starting')
"   call dein#call_hook('source')
"   call dein#call_hook('post_source')
" endif

filetype plugin indent on
syntax on

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

colorscheme nordfox
set background=dark

" encoding
if !has('nvim')
  set encoding=utf-8
endif
set termencoding=utf-8
set fileencoding=utf-8
let &fileencodings=join(['ucs-bom','iso-2022-jp','utf-8','euc-jp','cp932'])

" fileformat
set fileformat=unix
set fileformats=unix,dos,mac

" 行番号
set number
" 行番号横の印表示域
set signcolumn=yes

" カーソル位置のハイライト
set cursorline
set nocursorcolumn

" マウス
set mouse=

" 描画改善
" set lazyredraw
set ttyfast

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
" 置換時のプレビュー
if has('nvim')
  set inccommand=split
endif

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

set redrawtime=15000

" カーソル位置のシンタックス情報を表示
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" .env.* も .env と同じ filetype にする
lua << EOL
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '.env*',
  command = 'set filetype=conf',
})
EOL

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
vnoremap /r y:%s/\v<C-r>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
vnoremap /g y:Rg <C-r>=escape(@", '\\/.*$^~[]')<CR><CR>

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
nnoremap    <silent> [Tab]h     :<C-u>-tabmove<CR>
nnoremap    <silent> [tab]l     :<C-u>+tabmove<CR>
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

" C++
augroup CppConfig
  autocmd!
  autocmd FileType cpp nnoremap <buffer> <silent> sh :<C-u>hide edit %<.hpp<CR>
  autocmd FileType cpp nnoremap <buffer> <silent> ss :<C-u>hide edit %<.cpp<CR>
augroup END

