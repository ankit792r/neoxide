{ config, pkgs, inputs, ... }:

let
  # Try to use niri from flake, fallback to nixpkgs if unavailable
  niriPackage = 
    if inputs ? niri && inputs.niri.packages ? ${pkgs.system} then
      (inputs.niri.packages.${pkgs.system}.niri or inputs.niri.packages.${pkgs.system}.default)
    else
      pkgs.niri;
in
{
  # Niri window manager system packages
  # Note: Niri configuration is done via Home Manager xdg.configFile
  # This module provides system-level packages needed for niri
  
  environment.systemPackages = with pkgs; [
    # Niri window manager
    niriPackage
    
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