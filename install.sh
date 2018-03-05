#!/bin/sh
set -Ceu

abspath=$(cd $(dirname $0) && pwd)

ln -s $abspath/.vimrc     $HOME/.vimrc
ln -s $abspath/.gvimrc    $HOME/.gvimrc
ln -s $abspath/.zshrc     $HOME/.zshrc
ln -s $abspath/.zsh       $HOME/.zsh
ln -s $abspath/.tmux.conf $HOME/.tmux.conf
ln -s $abspath/.gitconfig $HOME/.gitconfig
ln -s $abspath/.tigrc     $HOME/.tigrc
ln -s $abspath/.hgrc      $HOME/.hgrc
ln -s $abspath/.gdbinit   $HOME/.gdbinit
ln -s $abspath/.bashrc    $HOME/.bashrc

mkdir -p $HOME/.cache
mkdir -p $HOME/.config
ln -s $abspath/.config/nvim $HOME/.config/nvim

mkdir -p $HOME/.config/fish
ln -s $abspath/.config/fish/config.fish $HOME/.config/fish/config.fish
ln -s $abspath/.config/fish/fishfile    $HOME/.config/fish/fishfile

mkdir -p $HOME/.config/fish/conf.d
ln -s $abspath/.config/fish/conf.d/000-env.fish $HOME/.config/fish/conf.d/000-env.fish

mkdir -p $HOME/.config/fish/functions
ln -s $abspath/.config/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

cp -r .vim       $HOME/
mkdir -p $HOME/vimbackup
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
