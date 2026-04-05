#!/bin/bash
set -Ceu

abspath=$(cd "$(dirname "$0")" && pwd)

# Nix のインストール
if ! (type nix &>/dev/null); then
  curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install
  # インストール直後のシェルセッションに Nix の PATH を反映
  if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  elif [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
fi

# Home Manager 設定の配置
mkdir -p "$HOME/.config"
ln -snf "$abspath/nix" "$HOME/.config/home-manager"

# 全環境を適用（パッケージ + dotfiles）
if type home-manager &>/dev/null; then
  home-manager switch
else
  nix run home-manager/master -- switch
fi
