#!/bin/bash
set -Ceu

abspath=$(cd "$(dirname "$0")" && pwd)

ln -sf "$abspath/.vimrc" "$HOME/.vimrc"
ln -sf "$abspath/.gvimrc" "$HOME/.gvimrc"
ln -sf "$abspath/.zshrc" "$HOME/.zshrc"
ln -sf "$abspath/.zsh" "$HOME/.zsh"
ln -sf "$abspath/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$abspath/.gitconfig" "$HOME/.gitconfig"
ln -sf "$abspath/.tigrc" "$HOME/.tigrc"
ln -sf "$abspath/.hgrc" "$HOME/.hgrc"
ln -sf "$abspath/.gdbinit" "$HOME/.gdbinit"
ln -sf "$abspath/.bashrc" "$HOME/.bashrc"
ln -sf "$abspath/bin" "$HOME/bin"

mkdir -p "$HOME/.cache"
mkdir -p "$HOME/.config"
ln -sf "$abspath/.config/nvim" "$HOME/.config/nvim"
ln -sf "$abspath/.config/git" "$HOME/.config/git"
ln -sf "$abspath/.config/gitui" "$HOME/.config/gitui"

ln -sf "$abspath/.config/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/fish"
ln -sf "$abspath/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sf "$abspath/.config/fish/fishfile" "$HOME/.config/fish/fishfile"

mkdir -p "$HOME/.config/fish/conf.d"
ln -sf "$abspath/.config/fish/conf.d/000-env.fish" "$HOME/.config/fish/conf.d/000-env.fish"

mkdir -p "$HOME/.config/fish/functions"
ln -sf "$abspath/.config/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"

cp -r .vim "$HOME/"
mkdir -p "$HOME/vimbackup"

source "$abspath/init-tools.sh"
