{ config, pkgs, ... }:

{
  # Desktop environment packages and utilities
  # Note: Core wayland packages are in niri.nix to avoid duplication
  
  environment.systemPackages = with pkgs; [
    # Desktop utilities
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    
    # Application launcher
    rofi
    
    # Status bar
    waybar
    
    # Notification daemon
    mako
    
    # File manager
    nautilus
    
    # Image viewer
    feh
    imv
    
    # PDF viewer
    zathura
    
    # Media players
    mpv
    vlc
    
    # Browsers
    firefox
    
    # Terminal emulators
    alacritty
    kitty
    foot
    
    # System tools
    pavucontrol
    blueman
  ];

  # XDG portal integration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}