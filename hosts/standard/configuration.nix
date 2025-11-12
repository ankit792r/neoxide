{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/networks.nix
    ../../modules/users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [];

  home-manager.users.ankit = import ./home.nix;
  
  system.stateVersion = "25.05";
}

# this is nix config proect with flakes, i have two flake minimal and standard, using both in main @flake.nix  file. but while testing this config getting error as attribute username is missing  in @configuration.nix file, why getting error and how to fix that