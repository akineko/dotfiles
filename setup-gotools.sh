#!/bin/bash
set -Ceux

# common
go get -u github.com/motemen/ghq
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/mattn/memo
go get -u github.com/direnv/direnv

# vim
go get -u github.com/mattn/files
go get -u golang.org/x/tools/gopls

# golang
# go get github.com/golang/dep/cmd/dep
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/motemen/gore
go get -u github.com/k0kubun/pp
go get -u github.com/motemen/gofind/cmd/gofind
go get -u github.com/clipperhouse/gen

