{
  description = "Main flake that imports minimal and standard profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    minimal.url = "path:./hosts/minimal";
    standard.url = "path:./hosts/standard";
  };

  outputs = { self, nixpkgs, minimal, standard, ... }: {
    nixosConfigurations = {
      minimal = minimal.nixosConfigurations.minimal;
      standard = standard.nixosConfigurations.standard;
    };
  };
}
