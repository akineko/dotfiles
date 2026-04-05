{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./dotfiles.nix
    ./shell.nix
  ];

  home = {
    username = "akineko";
    homeDirectory = "/home/akineko";

    # Home Manager のバージョン（初回設定時のバージョンを指定）
    stateVersion = "24.11";
  };

  # unfree パッケージを許可（terraform 等）
  nixpkgs.config.allowUnfree = true;

  # Home Manager 自身の管理を有効化
  programs.home-manager.enable = true;
}
