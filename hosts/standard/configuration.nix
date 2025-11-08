{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/networks.nix
    ../../modules/users.nix
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  networking.networkmanager.enable = true;
  
  environment.systemPackages = with pkgs; [
  ];
  home-manager.users.ankit = import ./home.nix;
  
}
