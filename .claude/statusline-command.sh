#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract model display name
model_name=$(echo "$input" | jq -r '.model.display_name')

# Calculate context usage percentage
usage=$(echo "$input" | jq '.context_window.current_usage')
if [ "$usage" != "null" ]; then
    current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    size=$(echo "$input" | jq '.context_window.context_window_size')
    pct=$((current * 100 / size))
    context_info=$(printf '%d%%' "$pct")
else
    context_info="0%"
fi

# Get git branch
git_branch=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    git_branch=$(git branch --show-current 2>/dev/null || echo "")
fi

# Build status line with emojis and separators
# Green color for git branch
GREEN='\033[32m'
RESET='\033[0m'

if [ -n "$git_branch" ]; then
    printf '🤖 %s | 🧠 %s | %b%s%b' "$model_name" "$context_info" "$GREEN" "$git_branch" "$RESET"
else
    printf '🤖 %s | 🧠 %s' "$model_name" "$context_info"
fi
