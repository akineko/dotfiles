#!/bin/bash
set -Ceu

abspath=$(cd "$(dirname "$0")" && pwd)

ln -snf "$abspath/.vimrc" "$HOME/.vimrc"
ln -snf "$abspath/.gvimrc" "$HOME/.gvimrc"
ln -snf "$abspath/.zshrc" "$HOME/.zshrc"
ln -snf "$abspath/.zshenv" "$HOME/.zshenv"
ln -snf "$abspath/.zsh" "$HOME/.zsh"
ln -snf "$abspath/.tmux.conf" "$HOME/.tmux.conf"
ln -snf "$abspath/.gitconfig" "$HOME/.gitconfig"
ln -snf "$abspath/.tigrc" "$HOME/.tigrc"
ln -snf "$abspath/.hgrc" "$HOME/.hgrc"
ln -snf "$abspath/.gdbinit" "$HOME/.gdbinit"
ln -snf "$abspath/.bashrc" "$HOME/.bashrc"
ln -snf "$abspath/bin" "$HOME/bin"
ln -snf "$abspath/aqua.yaml" "$HOME/aqua.yaml"

mkdir -p "$HOME/.cache"
mkdir -p "$HOME/.config"
ln -snf "$abspath/.config/nvim" "$HOME/.config/nvim"
ln -snf "$abspath/.config/git" "$HOME/.config/git"
ln -snf "$abspath/.config/gitui" "$HOME/.config/gitui"
ln -snf "$abspath/.config/mise" "$HOME/.config/mise"
ln -snf "$abspath/.config/zsh" "$HOME/.config/zsh"
ln -snf "$abspath/.config/sheldon" "$HOME/.config/sheldon"

mkdir -p "$HOME/.claude"
ln -snf "$abspath/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -snf "$abspath/.claude/setttings.json" "$HOME/.claude/settings.json"
ln -snf "$abspath/.claude/.mcp.json" "$HOME/.claude/.mcp.json"
ln -snf "$abspath/.claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"

ln -snf "$abspath/.config/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/fish"
ln -snf "$abspath/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -snf "$abspath/.config/fish/fishfile" "$HOME/.config/fish/fishfile"

mkdir -p "$HOME/.config/fish/conf.d"
ln -snf "$abspath/.config/fish/conf.d/000-env.fish" "$HOME/.config/fish/conf.d/000-env.fish"

mkdir -p "$HOME/.config/fish/functions"
ln -snf "$abspath/.config/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"

cp -r .vim "$HOME/"
mkdir -p "$HOME/vimbackup"

source "$abspath/init-tools.sh"
