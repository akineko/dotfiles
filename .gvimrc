" ----- ↓ gvim用設定 ↓ -----

if has('gui_running')
    " 列幅
    set columns=160
    " 行数
    set lines=60
    " カラースキーマ
    colorscheme h2u_black

endif

" ----- ↑ gvim用設定 ↑ -----

" ----- ↓ gvim用設定 ↓ -----

if !has('gui_running')
    colorscheme desert
endif

" ----- ↑ gvim用設定 ↑ -----

if has('win32') || ('win64')
    " Windowsの場合の処理
endif

" runtimepathのWindow・Linuxの共通化
set runtimepath+=$HOME/.vim,$HOME/.vim/after

" Vi互換オフ
set nocompatible

" ヘルプファイルの優先度
set helplang& helplang=ja,en

" 文字コードの設定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso2022-jp,utf-16,sjis,cp932,euc-jp
set nobomb

" 改行コードの自動認識
set fileformat=unix
set fileformats=unix,dos,mac

" スワップの設定
set swapfile
set directory=$HOME/vimbackup

" splitの表示位置を右
set splitbelow

" vsplitの表示位置を下
set splitright

" ***** バックアップの設定 *****
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
set scrolloff=10

" ***** 検索に関する設定 *****
" 小文字での検索時に大文字小文字を区別しない
set ignorecase
" 大文字がある場合のみ大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索結果をハイライトしない
" set nohlsearch
" 検索のループ
set wrapscan

" 補完の際の大文字小文字の区別しない ignorecaseとsmartcaseに依存
set infercase

set pumheight=20

" ビープ音消去
set visualbell t_vb=

" 行番号や色分けなど
set number
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

" キーワード補完の検索対象
"set complete=.,b,u,i

" コマンドラインの行数
set cmdheight=2

" スクリプト実行中に画面を描画しない
"set lazyredraw

" ***** statuslineの設定 *****
" 常に表示
set laststatus=2
"set statusline=

" ***** タブ関係の設定 *****
" タブ幅の設定
set tabstop=4
" タブで挿入されるスペース数
set softtabstop=4
" autoindentのスペース数
set shiftwidth=4
" タブをスペースに置換
set expandtab
" 行頭でのタブをshiftwidthの幅に
set smarttab
" オートインデント
set autoindent
" オートインデントが賢くなる
set smartindent
" '>' '<' でのインデントをshiftwidthの倍数
set shiftround

" BackSpaceの設定
set backspace=indent,eol,start

" 外部でのファイル更新を自動読み込み
set autoread

" 編集中の内容を保ったまま別画面に切り替え
set hidden

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
set wildmenu

" グローバルなマークを使用可にする
set viminfo+=f1

" ***** foldの設定 *****
" foldを有効
set foldenable
" fold情報を表示する幅
" set foldcolumn=2
" foldの自動閉じ
" set foldclose=all
" foldの動作
" set foldmethod=marker
" foldの最小行数
set foldminlines=2

" UTF-8で開き直すコマンド
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>

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


" -*-*-*-*-*- ↓ Key-mappings ↓ -*-*-*-*-*-

" ：と；の置き換え
noremap ; :
noremap : ;

" .vimrcの編集・リロード
nnoremap    <silent> <Space>.       :<C-u>edit $MYGVIMRC<CR>
nnoremap    <silent> <Space>l.  	:<C-u>source $MYGVIMRC<CR>

" マークやレジスタ
nnoremap    <Space>m    :<C-u>marks
nnoremap    <Space>r    :<C-u>registers

" 最後に変更されたテキストを選択
nnoremap    gc          `[v`]

" ***** タブの設定 *****
" タブのラベル表示の設定 0:なし 1:2以上で表示 2:常に表示
set showtabline=1

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

" カレントディレクトリ移動用のコマンドの定義
command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        |cd %:p:h
    else
        execute '|cd' . a:directory
    endif

    if a:bang ==''
        pwd
    endif
endfunction
" コマンドをマッピング
nnoremap    <silent> <Space>cd      :<C-u>CD<CR>

" NERD treeの表示切替
nnoremap    <f2>    :NERDTreeToggle<CR>

" ***** bufexplorer *****
" nnoremap    <F3>    :BufExplorerVerticalSplit<CR>
nnoremap    <F3>    :BufExplorer<CR>

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
" ファイルオープン後の動作 0:そのまま 1:閉じる
let NERDTreeQuitOnOpen = 1
" 隠しファイルの表示 0:非表示 1:表示
let NERDTreeShowHidden = 1
" ツリーウィンドウの横幅
let NERDTreeWinSize = 30

" ***** NERD Commenter *****
" コメント間のスペース幅
let NERDSpaceDelims = 1

" ***** neocomplcache *****
let g:neocomplcache_enable_at_startup = 1

" -*-*-*-*-*- ↑ Pluginの設定 ↑ -*-*-*-*-*-

