{
  description = "akineko's dotfiles managed by Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, tpm, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."akineko" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        dotfilesDir = "/home/akineko/dev/src/github.com/akineko/dotfiles";
        inherit tpm;
      };
      modules = [
        ./home.nix
      ];
    };

    # 別環境を追加する場合はここに定義を追加する
    # homeConfigurations."akineko@work" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #   extraSpecialArgs = {
    #     dotfilesDir = "/home/akineko/dotfiles";
    #   };
    #   modules = [ ./home.nix ];
    # };
  };
}
