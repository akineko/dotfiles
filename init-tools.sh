#!/bin/bash
set -exu

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# if ! (type brew &>/dev/null); then
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

if ! (type mise &>/dev/null); then
  curl https://mise.run | sh
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  mkdir -p ~/.tmux/plugins/tpm
  git clone --depth 1 https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
