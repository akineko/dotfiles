#!/bin/bash
set -Ceux

# common
go get -u github.com/motemen/ghq
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/mattn/memo
go get -u github.com/direnv/direnv

# vim
go get -u github.com/mattn/files

# golang
# go get github.com/golang/dep/cmd/dep
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/motemen/gore
go get -u github.com/k0kubun/pp
go get -u github.com/motemen/gofind/cmd/gofind
go get -u github.com/clipperhouse/gen

# from vim-go
go get -u github.com/klauspost/asmfmt/cmd/asmfmt
go get -u github.com/go-delve/delve/cmd/dlv
go get -u github.com/kisielk/errcheck
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/rogpeppe/godef
go get -u github.com/zmb3/gogetdoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/lint/golint
go get -u golang.org/x/tools/gopls
go get -u github.com/fatih/gomodifytags
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/josharian/impl
go get -u honnef.co/go/tools/cmd/keyify
go get -u github.com/fatih/motion
go get -u github.com/koron/iferr

