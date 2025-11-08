{
  description = "Standard NixOS profile flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { config, home-manager, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.standard = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          { home-manager.users."${config.var.username}" = import ./home.nix; }
        ];
      };
    };
}
