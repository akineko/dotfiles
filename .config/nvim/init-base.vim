" Bundles
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tyru/DumbBuf.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Shougo/neocomplcache'
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

"RUNTIMEPATHの共通化
set runtimepath+=$HOME/.vim,$HOME/.vim/after

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

" 現在のモードを表示
set showmode

" モードラインを有効
set modelines=2

" puttyでマウス操作可能にする設定
" screen: xterm2  tmux: xterm
set mouse=a
" set ttymouse=xterm2
set ttymouse=xterm

" ***** バックアップ関連の設定 *****
" スワップの設定
set directory=$HOME/vimbackup

" バックアップの保存先
set backupdir=$HOME/vimbackup
" バックアップファイルの拡張子
set backupext=.back
" ファイルのコピーを作成してバックアップにし上書き保存
set backupcopy=yes

" ポップアップで表示される補完候補の最大表示数
set pumheight=10

" 行番号や色分けなど
set guicursor& guicursor=a:blinkwait1000-blinkon750-blinkoff750

" GUI用のオプション e削除:タブの非GUI化 m→M:メニュー非表示 r削除:サイドバー非表示
set guioptions& guioptions=ceMgr

" クリップボードの使用
set clipboard& clipboard+=unnamed

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

" ***** タブ関係の設定 *****
" タブのラベル表示の設定 0:なし 1:2以上で表示 2:常に表示
set showtabline=2

" BackSpaceの設定
set backspace=indent,eol,start

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

" マークやレジスタ
nnoremap    <Space>m    :<C-u>marks
nnoremap    <Space>r    :<C-u>registers

".vimrcの編集・リロード
nnoremap <Space>.
\   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>L
\   :<C-u>source $MYVIMRC<CR>

" ヘルプファイルを右分割で開くコマンド
nnoremap <C-h>  :<C-u>vertical belowright help<Space>

" 最後に変更されたテキストを選択
nnoremap    gc          `[v`]

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

" ***** neocomplcache *****
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_enable_quick_match = 1

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

" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set noshowmode

" vim: set expandtab:

