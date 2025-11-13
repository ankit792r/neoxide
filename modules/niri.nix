{ config, pkgs, inputs, ... }:

{
  # Niri window manager system packages
  # Note: Niri configuration is done via Home Manager xdg.configFile
  # This module provides system-level packages needed for niri
  
  environment.systemPackages = with pkgs; [
    # Niri window manager
    inputs.niri.packages.${pkgs.system}.niri
    
    # Wayland compositor essentials
    wayland
    wayland-protocols
    wayland-utils
    
    # Window manager utilities
    wlr-randr
    wl-clipboard
    
    # Screenshot tools
    grim
    slurp
    
    # Background
    swaybg
    
    # Required for wayland session
    xdg-desktop-portal-wlr
  ];
}

