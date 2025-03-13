# direnv
if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# zoxide
if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# gcloud
if [ -f /usr/share/google-cloud-sdk/completion.zsh.inc ]; then
  source /usr/share/google-cloud-sdk/completion.zsh.inc
fi

# github
if type gh &>/dev/null; then
  eval "$(gh completion -s zsh)"
fi

