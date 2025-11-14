{ config, pkgs, inputs, ... }:

{
  # Hyper-V guest configuration
  # This module should be imported when running NixOS in Hyper-V
  
  imports = [
    # Reference the hyperv-guest module from nixpkgs input (flake-compatible)
    "${inputs.nixpkgs}/nixos/modules/virtualisation/hyperv-guest.nix"
  ];

  # Enable Hyper-V guest support
  virtualisation.hypervGuest.enable = true;

  # Blacklist hyperv_fb module to prevent display issues
  # This is often needed for graphical environments in Hyper-V
  boot.blacklistedKernelModules = [ "hyperv_fb" ];

  # Additional Hyper-V optimizations
  boot.kernelParams = [
    "nomodeset"  # Disable kernel mode setting (may help with graphics)
  ];
}