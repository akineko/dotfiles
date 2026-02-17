# direnv
if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# zoxide
if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# git-wt
if type git-wt &>/dev/null; then
  eval "$(git wt --init zsh)"
fi
