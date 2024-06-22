[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fzf-ghq () {
  local selected_dir=$(ghq list --full-path | fzf --query "$LBUFFER")
  if [[ -z "$selected_dir" ]]; then
    zle redisplay
    return 0
  fi
  BUFFER="cd ${selected_dir}"
  zle accept-line
  zle -Rc
}
zle -N fzf-ghq
bindkey '^g' fzf-ghq

function fzf-cd() {
  local dir="$(git ls-tree -dr --name-only --full-name --full-tree HEAD | sed -e "s|^|`git rev-parse --show-toplevel`/|" | fzf -0 -1 +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  BUFFER="cd $dir"
  zle accept-line
  zle -Rc
}
zle -N fzf-cd
bindkey '^d' fzf-cd

