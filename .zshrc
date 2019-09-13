# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# 補完機能の有効化
autoload -U compinit
compinit

# プロンプトのカラー化
autoload -U colors
colors

autoload -Uz cdr

# 変数定義をすると同時にexportされ環境変数としても設定する
setopt all_export

# ディレクトリ名のみで移動
setopt auto_cd
# cd時にディレクトリスタックにpushdする
setopt auto_pushd
# ディレクトリスタックの重複不可
setopt pushd_ignore_dups
# 引数なしのpushdをpushd $HOMEへ
setopt pushd_to_home
# 絶対パスが入った変数をディレクトリとして扱う
setopt cdable_vars

# -------------------- 補完関連の設定 --------------------
# 補完候補が複数あるときに自動的にメニューをリストアップ
setopt auto_list
# 連続する補完要求があると自動的にメニューをリストアップ
setopt auto_menu
# 絶対パスが入った変数をディレクトリとして扱う
setopt auto_name_dirs
# パスが入った変数を補完した時に末尾に/を足す
setopt auto_param_slash
# 上記の設定で足された/の後にスペースを入力すると自動で削除
setopt auto_remove_slash
# 補完候補の余白の自動圧縮表示
setopt list_packed
# 補完の表示順序を水平方向に
setopt list_rows_first
# 補完候補にファイル情報を表示
setopt list_types
# 補完候補表示時に最初の候補をカーソル位置に挿入
#setopt menu_complete

# -------------------- ファイルグロブの設定 --------------------
# ファイルグロブの有効化
setopt glob
# 拡張グロブの有効化 []の外でも^の使用可など
setopt extended_glob
# ファイルグロブで大文字小文字を区別しない
unsetopt case_glob
# =コマンドをコマンドの絶対パスに変換
setopt equals
# ファイル候補のソートで数値を正しく認識
setopt numeric_glob_sort
# lsコマンドなどでパターンマッチを複数指定した場合に
# 途中でエラーがあっても結果も表示する
setopt nomatch

# -------------------- ヒストリの設定 --------------------
# セッションが終了した順にヒストリに追記
setopt append_history
# !によるヒストリ展開の有効化
setopt bang_hist
# 実行時間をヒストリに記録
# setopt extended_history
# ヒストリ関係のビープ音をオフ
unsetopt hist_beep
# 古いヒストリの削除時に重複コマンドを優先
setopt hist_expire_dups_first
# ヒストリ内の重複したコマンドがあれば古いのを削除
setopt hist_ignore_all_dups
# 同じコマンドの連続は記録しない
setopt hist_ignore_dups
# 先頭にスペースがあるコマンドは記録しない
setopt hist_ignore_space
# ヒストリに関数定義は記録しない
setopt hist_no_functions
# historyコマンドは記録しない
setopt hist_no_store
# 余分なスペースを削除して記録
setopt hist_reduce_blanks
# ヒストリファイル保存時に古いコマンドと同じなら無視する
setopt hist_save_no_dups
# 複数セッション起動時にコマンド実行してすぐにヒストリファイルを保存する
#setopt inc_append_history
# ヒストリの共有
setopt share_history

# -------------------- 入出力の設定 --------------------
# エイリアスの有効化
setopt aliases
# リダイレクトによる上書きを禁止
unsetopt clobber
# コマンド名のスペル訂正
setopt nocorrect
# 引数のスペル訂正
# setopt correct_all
# スペル訂正時にDVORAK配列を前提に
setopt dvorak
# Ctrl+S,Ctrl+Qの無効化
unsetopt flow_control
# Ctrl+Dによるログアウトの抑制
setopt ignore_eof
# 対話的シェルでコメントの有効化
setopt interactive_comments
# コマンドとパスの対応にハッシュテーブルを利用
setopt hash_cmds
# コマンド名のハッシュ時にディレクトリもハッシュ化
setopt hash_dirs
# コマンドに/が含まれていても通常のパス検索を行う
setopt path_dirs
# rmコマンドで*指定時の確認をオフ
# setopt rm_star_silent
# rmコマンドで*指定時に一定時間waitする
# setopt rm_star_wait
# 制御構文で短縮形の有効化
setopt short_loops

# -------------------- ジョブ制御の設定 --------------------
# ジョブの頭文字だけでジョブの再実行を行う
# setopt auto_resume
# バックグラウンドジョブを低優先度で実行
setopt bg_nice
# zsh終了時にバックグラウンドジョブや一時停止ジョブを表示
# setopt check_jobs
# zsh終了時に起動しているジョブにHUPシグナルの送信
# setopt hup
# ジョブリストにロングフォーマットの使用
# setopt long_list_jobs
# ジョブ制御を可能にする
setopt monitor
# バックグラウンドジョブの状態を即時表示
setopt notify

# -------------------- ジョブ制御の設定 --------------------
# プロンプトの定義で!を特殊文字として扱う
#setopt prompt_bang
# プロンプトの定義で%を特殊文字として扱う
#setopt prompt_percent
# プロンプトの定義で変数置換やコマンド置換などを扱う
#setopt prompt_subst



set cdable_vars
# End of lines added by compinstall

# autoloadされる関数を検索するパスの追加
fpath=($fpath ~/.zfunc)

# 重複した設定の自動削除
typeset -U path cdpath fpath manpath

# プロンプトの設定
# PROMPT="[%n@%m]%# "
# PROMPT="[%n@%m] %{${fg[blue]}${bg[blue]}%}%~${reset_color} %{${fg[white]}%}%# "
PROMPT="[%n@%m] %F{cyan}%~%f
%# "
# RPROMPT=' %~'
# RPROMPT="%{${fg[green]}%} %~%{${fg[white]}%}"

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# キーバインドの設定
# bindkey -v
bindkey -e
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# history関連の設定
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
DIRSTACKSIZE=20

# 色付けの為の設定
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# svnの設定
export SVN_EDITOR=vim

# mercurialの設定
export HGENCODING=utf8

# 端末を256色に
export TERM=xterm-256color

# XDG_CONFIG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export PATH="$HOME/.local/bin:$PATH"

# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
  source ~/.zplug/init.zsh

  if ! zplug check --verbose; then
    zplug install
  fi
  zplug load
fi

bindkey '^g' anyframe-widget-cd-ghq-repository

# linuxbrew
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if type brew &>/dev/null; then
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  compinit
fi

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
if type anyenv &>/dev/null; then
  eval "$(anyenv init - zsh)"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# -------------------------------------------------------------------------------
# Golang
# -------------------------------------------------------------------------------

# GOROOT=$HOME/go
GOPATH=$HOME/dev

export GOENV_DISABLE_GOPATH=1
export PATH="$GOPATH/bin:$PATH"

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function fzf-cd() {
  local dir="$(git ls-tree -dr --name-only --full-name --full-tree HEAD | sed -e "s|^|`git rev-parse --show-toplevel`/|" | fzf -0 -1 +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$dir"
  zle reset-prompt
}
zle -N fzf-cd
bindkey '^d' fzf-cd

# direnv
export EDITOR=nvim
eval "$(direnv hook zsh)"

# -------------------------------------------------------------------------------
# Ruby
# -------------------------------------------------------------------------------

# rvmの設定
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

# -------------------------------------------------------------------------------
# Python
# -------------------------------------------------------------------------------

# virtualenvwrapperをインポート
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	source /usr/bin/virtualenvwrapper.sh
fi
# virtualenvwrapperの仮想環境用ディレクトリ
export WORKON_HOME=$HOME/.virtualenvs

# pipのダウンロードファイルのキャッシュディレクトリ
export PIP_DOWNLOAD_CACHE=$HOME/.pip_cache
# パッケージをvirtualenv環境下にインストール
export PIP_RESPECT_VIRTUALENV=true
# pipの実行にvirtualenv環境下である事を必須に
# export PIP_REQUIRE_VIRTUALENV=true

if [ -f $HOME/.pythonbrew/etc/bashrc ]; then
	source $HOME/.pythonbrew/etc/bashrc
fi

if type pipenv &>/dev/null; then
  eval "$(pipenv --completion)"
fi

# gcloud
if [ -f /usr/share/google-cloud-sdk/completion.zsh.inc ]; then
  source /usr/share/google-cloud-sdk/completion.zsh.inc
fi

