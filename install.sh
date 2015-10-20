#!/bin/sh

cp -r .vim       $HOME/
cp    .vimrc     $HOME/
cp    .gvimrc    $HOME/
cp    .zshrc     $HOME/
cp    .tmux.conf $HOME/
cp    .gitconfig $HOME/
cp    .hgrc      $HOME/
cp    .gdbinit   $HOME/
cp    .bashrc    $HOME/

mkdir $HOME/vimbackup
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
