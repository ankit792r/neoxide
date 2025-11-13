{ config, pkgs, ... }:

{
  # Filesystem configuration
  # This is a template - you should generate hardware-configuration.nix
  # using: sudo nixos-generate-config --dir hosts/<host>/
  # and import it in your host configuration.nix
  
  # Example filesystem configuration (uncomment and customize):
  # fileSystems."/" = {
  #   device = "/dev/disk/by-uuid/YOUR-UUID-HERE";
  #   fsType = "ext4";
  # };
  #
  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-uuid/YOUR-BOOT-UUID-HERE";
  #   fsType = "vfat";
  # };
  #
  # swapDevices = [ ];
  # Or for swap file:
  # swapDevices = [
  #   {
  #     device = "/swapfile";
  #     size = 4096; # in MB
  #   }
  # ];
}

