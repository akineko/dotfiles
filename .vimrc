" Vi互換オフ
set nocompatible

" Setup NeoBundle -----------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tyru/DumbBuf.vim'
NeoBundle 'sjl/gundo.vim'
if has('python3')
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'roxma/nvim-yarp'
  NeoBundle 'roxma/vim-hug-neovim-rpc'
endif
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'osyo-manga/vim-cpp11-syntax'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vimplenote-vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'othree/eregex.vim'

NeoBundle 'bufexplorer.zip'
NeoBundle 'SQLUtilities'
NeoBundle 'dbext.vim'
NeoBundle 'SQLComplete.vim'
NeoBundle 'taglist.vim'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'capslock.vim'
NeoBundle 'Quich-Filter'
NeoBundle 'grep.vim'
NeoBundle 'mru.vim'
NeoBundle 'renamer.vim'
NeoBundle 'sudo.vim'
NeoBundle 'trinity.vim'
" NeoBundle 'project.tar.gz'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

"RUNTIMEPATHの共通化
set runtimepath+=$HOME/.vim,$HOME/.vim/after

"文字コードの設定
" set encoding=japan
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso2022-jp,utf-16,sjis,cp932,euc-jp

" tmux用設定
if &term == 'screen'
    set <F1>=[11~
    set <F2>=[12~
    set <F3>=[13~
    set <F4>=[14~
    set <F5>=[15~
    set <F6>=[17~
    set <F7>=[18~
    set <F8>=[19~
    set <F9>=[20~
    set <F10>=[21~
    set <F11>=[23~
    set <F12>=[24~
endif

" カラースキーマの設定
set t_Co=256
" colorscheme desert
" colorscheme h2u_black
colorscheme DarkDefault

" C++11用syntaxの有効化
let g:c_no_curly_error = 1

" カラースキーマのカスタマイズ
command! MyHi call MyColor()

function! MyColor()
    highlight TabLineSel term=bold cterm=bold,underline ctermfg=3
    highlight Visual term=reverse ctermbg=60
endfunction

" ヘルプファイルの優先度
set helplang& helplang=ja,en

" ビープ音消去
set visualbell t_vb=

" コマンドをステータス行に表示
set showcmd
" 現在のモードを表示
set showmode

" モードラインを有効
set modeline
set modelines=2

" splitの表示位置を下に
set splitbelow
" vsplitの表示位置を右に
set splitright

" puttyでマウス操作可能にする設定
" screen: xterm2  tmux: xterm
set mouse=a
" set ttymouse=xterm2
set ttymouse=xterm

" ***** バックアップ関連の設定 *****
" スワップの設定
set noswapfile
set directory=$HOME/vimbackup

" バックアップを作らない
set nobackup
" 保存時のみバックアップを作成
set writebackup
" バックアップの保存先
set backupdir=$HOME/vimbackup
" バックアップファイルの拡張子
set backupext=.back
" ファイルのコピーを作成してバックアップにし上書き保存
set backupcopy=yes

" スクロールのマージ
set scrolloff=5

" ***** 検索に関する設定 *****
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

" ポップアップで表示される補完候補の最大表示数
set pumheight=10

" 行番号や色分けなど
set number
set showmatch
set ruler
set cursorline
set cursorcolumn
set guicursor& guicursor=a:blinkwait1000-blinkon750-blinkoff750

" 不可視文字の表示
" tab:最初２文字 trail:行末の空白 extends:折り返しの行末 precedes:折り返しの行頭 eol:行末
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<

syntax on
filetype on
filetype indent on
filetype plugin on

" GUI用のオプション e削除:タブの非GUI化 m→M:メニュー非表示 r削除:サイドバー非表示
set guioptions& guioptions=ceMgr

" クリップボードの使用
set clipboard& clipboard+=unnamed

" :コマンドの記録数
set history=100

" ターミナル接続の高速化
set ttyfast

" キーワード補完の検索対象
"set complete=.,b,u,i
set complete+=k

" コマンドラインの行数
set cmdheight=3

" スクリプト実行中に画面を描画しない
" set lazyredraw

" ***** statuslineの設定 *****
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに文字コードと改行文字を表示
if winwidth(0) >= 120
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetByte()}]\ %l
else
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetByte()}]\ %l
endif

" カーソルの下の文字コード取得の為の関数群
function! GetByte()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
endfunction

function! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2Hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunction

function! Nr2Hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunction

" インサートモードでステータスラインのカラーを変更
augroup InsertHock
    autocmd!
    autocmd InsertEnter * highlight StatusLine term=bold cterm=bold ctermfg=7 ctermbg=4
    autocmd InsertLeave * highlight StatusLine term=bold cterm=bold ctermfg=4 ctermbg=7
    " autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    " autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" ***** タブ関係の設定 *****
" タブのラベル表示の設定 0:なし 1:2以上で表示 2:常に表示
set showtabline=2
" タブ幅の設定
set tabstop=2
" タブで挿入されるスペース数
set softtabstop=2
" autoindentのスペース数
set shiftwidth=2
" タブをスペースに置換
set expandtab
" 行頭でのタブをshiftwidthの幅に
set smarttab
" オートインデント
set autoindent
" オートインデントが賢くなる
set smartindent
" Cプログラムのインデント
set cindent
" '>' '<' でのインデントをshiftwidthの倍数
set shiftround

" BackSpaceの設定
set backspace=indent,eol,start

" 外部でのファイル更新を自動読み込み
set autoread
" ウィンドウを移動する度にファイルの更新をチェックする自動コマンド
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" 編集中の内容を保ったまま別画面に切り替え
set hidden

" 改行コードの自動認識
" set fileformat=unix
" set fileformats=unix,dos,mac
" 会社用
set fileformat=unix
set fileformats=unix,dos,mac

" テキスト整形のオプション
set formatoptions=tcqlM1

" ファイルブラウザのディレクトリ位置
" last:前回のファイルブラウザ位置 buffer:バッファの位置 current:カレントディレクトリ
" {path}: 指定ディレクトリ
set browsedir=buffer

" ディレクトリ表示をツリー形式に
let g:netrw_liststyle=3

" XMLの閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml,html inoremap <buffer> </ </<C-x><C-o>
augroup END

" コマンドライン補完の候補を表示
set nowildmenu
set wildchar=<tab>
set wildmode=list:longest,full
" set wildmode=longest:full,full

" グローバルなマークを使用可にする
set viminfo+=f1

" ***** foldの設定 *****
" foldを有効
set foldenable
" fold情報を表示する幅
" set foldcolumn=2
" 自動で閉じるレベル
set foldlevel=1
" 自動で閉じる基準となる行数の下限値
set foldminlines=1
" foldの自動閉じ
" set foldclose=all
" foldの動作
" set foldmethod=marker
set foldmethod=syntax
" foldの最小行数
set foldminlines=2

" -*-*-*-*-*- ↓ 自作コマンド ↓ -*-*-*-*-*-

" UTF-8で開き直すコマンド
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>

" 保存時に行末の空白を除去
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換
" autocmd BufWritePre * :%s/\t/    /ge

" シンタックスハイライトの予約語を補完へ流用
autocmd FileType *
\   if &l:omnifunc == ''
\ |     setlocal omnifunc=syntaxcomplete#Complete
\ | endif

" Vim戦闘力測定コマンド
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines, 'v:val !~ pat'))
endfunction

command! -bar -bang -nargs=? -complete=file Scouter
\       echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\       echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)

" -*-*-*-*-*- ↑ 自作コマンド ↑ -*-*-*-*-*-

" -*-*-*-*-*- ↓ Key-mappings ↓ -*-*-*-*-*-

let mapleader = ","

" ：と；の置き換え
noremap ; :
noremap : ;

" マークやレジスタ
nnoremap    <Space>m    :<C-u>marks
nnoremap    <Space>r    :<C-u>registers

" ESC２回でハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

".vimrcの編集・リロード
nnoremap <Space>.
\   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>L
\   :<C-u>source $MYVIMRC<CR>

" ヘルプファイルを右分割で開くコマンド
nnoremap <C-h>  :<C-u>vertical belowright help<Space>

" 選択した文字列で検索
vnoremap <silent> // y/<C-r>=escape(@", '\\/.*$^~[]')<CR><CR>
" 選択した文字列で置換
vnoremap /r y:%S/<C-r>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" 最後に変更されたテキストを選択
nnoremap    gc          `[v`]

" ***** タブ操作の設定 *****
nnoremap    [Tab]               <Nop>
nmap        <C-t>               [Tab]
nnoremap    <silent> [Tab]n     :<C-u>tabnew<CR>
nnoremap    <silent> [Tab]c     :<C-u>tabclose<CR>
nnoremap    <silent> [Tab]o     :<C-u>tabonly<CR>
nnoremap    [Tab]j              gt
nnoremap    [Tab]k              gT
" <C-Tab>にもタブ切り替えを割り当て
nnoremap    <C-Tab>     gt
nnoremap    <C-S-Tab>   gT
nnoremap    <Tab>       gt

" ***** タグジャンプ操作の設定 *****
nnoremap    [Tag]               <Nop>
nmap        t                   [Tag]
nnoremap    [Tag]t              <C-]>
nnoremap    <silent> [Tag]j     :<C-u>tag<CR>
nnoremap    <silent> [Tag]k     :<C-u>pop<CR>
nnoremap    <silent> [Tag]l     :<C-u>tags<CR>

" ***** ウィンドウ操作の設定 *****
nnoremap    <S-Up>      <C-w>k
nnoremap    <S-Down>    <C-w>j
nnoremap    <S-Left>    <C-w>h
nnoremap    <S-Right>   <C-w>l
nnoremap    <Space>k    <C-w>k
nnoremap    <Space>j    <C-w>j
nnoremap    <Space>h    <C-w>h
nnoremap    <Space>l    <C-w>l
" nnoremap    <C-w>o      <C-w>_

" ***** insert mode でのカーソル移動 *****
inoremap    <M-k>       <Up>
inoremap    <M-j>       <Down>
inoremap    <M-h>       <Left>
inoremap    <M-l>       <Right>

" ***** 折畳(fold)の設定 *****
" foldの先頭へ
nnoremap    zh      [z
" foldの末尾へ
nnoremap    zl      ]z

" ***** text-manip *****
xmap <Space>d <Plug>(textmanip-duplicate-down)
" nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
" nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)


" カレントディレクトリ移動用のコマンドの定義
command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  " if a:directory == ''
      " |cd %:p:h
  " else
      " execute '|cd' . a:directory
  " endif

  " if a:bang ==''
      " pwd
  " endif
endfunction
" コマンドをマッピング
nnoremap    <silent> <Space>cd      :<C-u>CD<CR>

" 年月日の自動入力
inoremap <expr> ,dt strftime('%Y.%m.%d')

" C++用
nnoremap <silent> sh :<C-u>hide edit %<.h<CR>
nnoremap <silent> ss :<C-u>hide edit %<.cpp<CR>

" -*-*-*-*-*- ↑ Key-mappings ↑ -*-*-*-*-*-


" -*-*-*-*-*- ↓ Pluginの設定 ↓ -*-*-*-*-*-

" ***** Vimでの表示をHTML出力コマンド→ :TOhtml の設定 *****
" 1=true 0=false
" 行番号表示
let htmljj_number_lines = 1
" XHTMLで出力
let g:use_xhtml = 1
" CSS使用 ※HTMLに直接埋め込まれるので注意
let g:html_use_css = 1
" preタグの禁止
let g:html_no_pre = 1
" メタタグのcharsetの指定
let html_use_encoding = "UTF-8"
" メタタグが指定のものになるだけなので保存前に設定が必要
" 例：
" :TOhtml
" :set fenc=UTF-8
" :w

" CapsLockPlugin
imap <C-a> <C-O><Plug>CapsLockToggle

" sudoPlugin sudoで保存するコマンド :w sudo;%

" %の機能拡張Plugin:matchit.vimの有効化
source $VIMRUNTIME/macros/matchit.vim

" ***** YankRingの設定 *****
" 最大記録数
let g:yankring_max_history = 30
" YRShowの最大桁数
let g:yankring_max_sidplay = 80

let g:yankring_manual_clipboard_check = 0

" ***** MRU(ファイル履歴)の設定 *****
" :MRU でリスト表示i
" 最大記録数
let MRU_Max_Entries = 20
" 除外ファイルを正規表現にて指定
let MRU_Exclude_files = "^/tmp/.*\|^/var/tmp/.*"
" ファイルリストの高さ
let MRU_Window_height = 15
" ファイル決定後のリストの開閉動作 0:閉じない 1:閉じる
let MRU_Auto_Close = 1

" ***** テキスト整形ツール Alignの設定 *****
" 日本語対応
let g:Align_xstrlen = 3

" ***** Allargs 全てのバッファでコマンドを実行 *****
" 全てのバッファで置換
"   :Allargs %s/foo/bar/ge|update
" カレントの *.cpp を置換
"   :ar *.cpp

" ***** NERDTree *****
" NERD treeの表示切替
nnoremap    <f2>    :NERDTreeToggle<CR>
" ファイルオープン後の動作 0:そのまま 1:閉じる
let NERDTreeQuitOnOpen = 1
" 隠しファイルの表示 0:非表示 1:表示
let NERDTreeShowHidden = 1
" ツリーウィンドウの横幅
let NERDTreeWinSize = 30

" ***** bufexplorer *****
" nnoremap    <F3>    :BufExplorerVerticalSplit<CR>
nnoremap    <F3>    :BufExplorer<CR>

" ***** DumbBuf *****
let g:dumbbuf_hotkey='<F4>'

" ***** NERD Commenter *****
" コメント間のスペース幅
let NERDSpaceDelims = 1

" ***** deoplete *****
let g:deoplete#enable_at_startup = 1

" ユーザ定義スニペット補完ファイルのあるディレクトリ,区切りで複数可
"let g:neocomplcache_snippets_dir =

" ***** filtering.vim *****
nnoremap ,F :call Gather(input("Filter on term: "), 0)<CR>
nnoremap ,f :call Gather(@/, 0)<CR>:echo<CR>
nnoremap ,g :call GotoOpenSearchBuffer()<CR>
nnoremap ,d :call CloseAllSearchWindows()<CR>

" ***** gundo.vim *****
nnoremap <F7> :GundoToggle<CR>
nnoremap U :GundoToggle<CR>

" ***** taglist *****
nnoremap <silent> <F8> :TlistToggle<CR>

" ***** SourceExplorer *****
nnoremap <F9> :SrcExplToggle<CR>
" let g:SrcExpl_UpdateTags = 1
" let g:SrcExpl_RefreshMapKey = "<Space>"
" let g:SrcExpl_GoBackMapKey = "<C-b>"

" タグを選択した際にウィンドウを閉じるかどうか 0:そのまま 1:閉じる
let Tlist_Close_On_Select = 1
" タグツリーを自動的に閉じるかどうか 0:そのまま 1:閉じる
let Tlist_File_Fold_Auto_Close = 1
" タグウィンドウをオープン時のフォーカス移動 0:そのまま 1:移動する
let Tlist_GainFocus_On_ToggleOpen = 1
" タグウィンドウの幅
let Tlist_WinWidth = 40

" ***** TwitVim *****
nnoremap <Space>po  :<C-u>PosttoTwitter<CR>
nnoremap <Space>fr  :<C-u>FriendsTwitter<CR>
nnoremap <Space>re  :<C-u>RepliesTwitter<CR>

" -*-*-*-*-*- ↑ Pluginの設定 ↑ -*-*-*-*-*-

" vim: set expandtab:
