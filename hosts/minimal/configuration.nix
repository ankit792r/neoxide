{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/networks.nix
    ../../modules/users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
  ];
  home-manager.users.ankit = import ./home.nix;
  
  system.stateVersion = "25.05";
}
