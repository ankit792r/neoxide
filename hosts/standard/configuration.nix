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

  let
    usernames = builtins.attrNames config.users.users;
    username = builtins.head usernames;
  in {
    home-manager.users."${username}" = import ./home.nix;
  };
}
