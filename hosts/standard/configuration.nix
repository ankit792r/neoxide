{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/networks.nix
    ../../modules/users.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
  home-manager.users.ankit = import ./home.nix;
  
}
