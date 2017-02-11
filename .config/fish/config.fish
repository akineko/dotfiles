set -x TERM xterm-256color

# Subversion
set -x SVN_EDITOR nvim

# Mercurial
set -x HGENCODING utf8

# XDG_CONFIG
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# anyenv
# set -x PATH $HOME/.anyenv/bin $PATH
# eval (anyenv init - fish)

# rbenv
# set -x PATH $HOME/.rbenv/bin $PATH

# Python
set -x PATH $HOME/.local/bin $PATH

# Golang
set -x GOROOT $HOME/go
set -x GOPATH $HOME/dev
set -x PATH $GOROOT/bin $GOPATH/bin $PATH

