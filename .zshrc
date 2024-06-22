zstyle :compinstall filename '$HOME/.zshrc'

# 補完機能の有効化
autoload -Uz compinit && compinit

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
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export EDITOR=nvim
export SVN_EDITOR=nvim

export PATH="$PATH:$HOME/bin"

# 端末を256色に
if [[ $TMUX = "" ]] then
    export TERM="xterm-256color"
else
    export TERM="tmux-256color"
fi
export COLORTERM=truecolor

# プロンプトの設定
if ! (type starship &>/dev/null); then
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' formats '(%s)-[%b]'
  zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
  precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
  }

  PROMPT="[%n@%m] %F{cyan}%~%f %1(v|%F{green}%1v%f|)
%# "
fi

# sheldon
eval "$(sheldon source)"
