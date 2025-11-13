{ config, pkgs, ... }:

{
  # Boot configuration
  # Supports both UEFI and legacy boot
  
  # For UEFI systems (most modern systems)
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  # Alternative: For legacy BIOS systems, uncomment below and comment out systemd-boot above
  # boot.loader.grub = {
  #   enable = true;
  #   device = "/dev/sda"; # Change to your disk device
  #   useOSProber = true;
  # };
}