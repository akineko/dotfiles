#!/bin/bash
set -Ceux

# nixpkgs に無い Go ツール
go install github.com/mattn/memo@latest
go install github.com/k1LoW/git-wt@latest
go install github.com/kyoshidajp/ghkw@latest

# gotools（ruby の bundle と競合するため Nix 管理外）
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/godoc@latest

# Go 開発用ツール（エディタ連携）
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/motemen/gofind/cmd/gofind@latest
go install github.com/clipperhouse/gen@latest

# vim-go 用
go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/kisielk/errcheck@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/rogpeppe/godef@latest
go install github.com/zmb3/gogetdoc@latest
go install golang.org/x/lint/golint@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gorename@latest
go install github.com/jstemmer/gotags@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/josharian/impl@latest
go install honnef.co/go/tools/cmd/keyify@latest
go install github.com/fatih/motion@latest
go install github.com/koron/iferr@latest
