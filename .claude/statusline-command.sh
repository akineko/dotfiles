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

# Extract rate limit usage
five_hour_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

rate_info=""
if [ -n "$five_hour_pct" ] || [ -n "$seven_day_pct" ]; then
    rate_parts=""
    [ -n "$five_hour_pct" ] && rate_parts="5h:$(printf '%.0f' "$five_hour_pct")%"
    [ -n "$seven_day_pct" ] && rate_parts="$rate_parts 7d:$(printf '%.0f' "$seven_day_pct")%"
    rate_info=$(echo "$rate_parts" | sed 's/^ //')
fi

# Get git branch
git_branch=""
if git -c core.worktree= rev-parse --git-dir > /dev/null 2>&1; then
    git_branch=$(git -c core.worktree= branch --show-current 2>/dev/null || echo "")
fi

# Build status line with emojis and separators
# Green color for git branch
GREEN='\033[32m'
RESET='\033[0m'

status="🤖 $model_name | 🧠 $context_info"
[ -n "$rate_info" ] && status="$status | 📊 $rate_info"
if [ -n "$git_branch" ]; then
    printf "%s | ${GREEN}%s${RESET}" "$status" "$git_branch"
else
    printf "%s" "$status"
fi
