#!/bin/bash
set -exu

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

if [ ! -d ~/.zinit/bin ]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

