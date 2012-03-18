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
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
