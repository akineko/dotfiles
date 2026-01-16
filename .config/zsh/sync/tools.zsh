# direnv
if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# zoxide
if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# gwq
if type gwq &>/dev/null; then
  eval "$(gwq completion zsh)"
fi
