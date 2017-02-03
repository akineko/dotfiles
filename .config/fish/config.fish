# anyenv
set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - fish)

# Golang
set -x GOROOT $HOME/go
set -x GOPATH $HOME/dev
set -x PATH $GOROOT/bin $GOPATH/bin $PATH


