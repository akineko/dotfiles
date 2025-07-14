# XDG_CONFIG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export GOPATH=$HOME/dev

export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

autoload -Uz compinit && compinit
if type mise &>/dev/null; then
  eval "$(mise activate zsh)"
  eval "$(mise activate --shims)"
  eval "$(mise completions zsh)"
fi

if [[ -f $HOME/.zshenv.local ]]; then
  source $HOME/.zshenv.local
fi

