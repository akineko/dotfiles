function is_in_git_repo() {
  git rev-parse --is-inside-work-tree &> /dev/null
}

function git_checkout_with_track() {
  is_in_git_repo || return

  local branch=$(git branch -r | fzf | awk '{print $1}')
  if [[ -n "$branch" ]]; then
    git checkout --track $branch
  fi
  zle clear-screen
}
zle -N git_checkout_with_track

