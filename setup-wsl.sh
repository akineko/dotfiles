#!/bin/bash

# ビープ音OFF
touch ~/.inputrc
echo 'set bell-style none' >> ~/.inputrc

# Windows 側の PATH を引き継がない
echo "[interop]\\nappendWindowsPath = false" | sudo tee -a /etc/wsl.conf

# Git の認証情報を Windows 側と共有する
# Git for Windows をデフォルトのままインストールした前提
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"

# Homebrew で入れた zsh をデフォルトシェルにするなら
# sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh akineko
