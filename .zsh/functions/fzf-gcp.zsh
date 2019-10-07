function gcp-project-selector() {
  gcloud projects list | tail -n +2 | fzf | awk '{print $1}'
}

function gcp-ssh-execute() {
  local project=$(gcp-project-selector)
  if [[ -z "$project" ]]; then
    return 1
  fi

  local line=$(gcloud compute --project "$project" instances list | tail -n +2 | fzf)
  if [[ -z "$line" ]]; then
    return 1
  fi

  local instance=$(awk '{print $1}' <<< $line)
  local zone=$(awk '{print $2}' <<< $line)
  gcloud compute --project "$project" ssh --zone "$zone" "$instance"
}

