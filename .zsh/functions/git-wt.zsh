function wt() {
  local worktree=$(git wt | tail -n +2 | awk '{print ($1 == "*") ? $3 : $2}' | fzf --preview="git show --color {}")
  if [[ -n "$worktree" ]]; then
    git wt "$worktree"
  fi
}

