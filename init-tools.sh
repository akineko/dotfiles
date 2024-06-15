#!/bin/bash
set -exu

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

if [ ! -d ~/.zinit/bin ]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

if ! (type brew &>/dev/null); then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! (type mise &>/dev/null); then
  curl https://mise.run | sh
fi

# if ! (type volta &>/dev/null); then
#   curl https://get.volta.sh | bash -s -- --skip-setup
# fi
