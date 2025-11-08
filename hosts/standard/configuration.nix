{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/networks.nix
    ../../modules/users.nix
  ];

  let
    usernames = builtins.attrNames config.users.users;
    username = builtins.head usernames;
  in {
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    networking.networkmanager.enable = true;
  
    environment.systemPackages = with pkgs; [
    ];

  
    home-manager.users."${username}" = import ./home.nix;
  };
}
