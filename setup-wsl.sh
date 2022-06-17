#!/bin/bash

# Distrod https://github.com/nullpo-head/wsl-distrod
curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
chmod +x install.sh
sudo ./install.sh install
sudo /opt/distrod/bin/distrod enable
rm install.sh

# ビープ音OFF
echo 'set bell-style none' > ~/.inputrc

# Windows 側の PATH を引き継がない
print "[interop]\\nappendWindowsPath = false" | sudo tee -a /etc/wsl.conf

# Git の認証情報を Windows 側と共有する
# Git for Windows をデフォルトのままインストールした前提
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"

# Homebrew で入れた zsh をデフォルトシェルにするなら
# sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh akineko
