# volta
if [ -d ~/.volta ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

if type pnpm &>/dev/null; then
  eval "$(pnpm completion zsh)"
fi
