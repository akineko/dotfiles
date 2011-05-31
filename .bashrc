#!/bin/bash

export PATH=$HOME/bin:$PATH
# export PATH=$PATH:$HOME/opt/bin
export TERM=xterm-256color

# rvmの設定
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

function svndiff3() {
  vimdiff $1.working $1.merge-left* $1.merge-right*;
}

alias svndiff="svn diff --diff-cmd ~/.vim/scripts/svndiff"

