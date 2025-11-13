{ config, pkgs, ... }:

{
  # Desktop environment packages and utilities
  
  environment.systemPackages = with pkgs; [
    # Desktop utilities
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    
    # Wayland utilities
    wayland
    wayland-protocols
    wayland-utils
    
    # Application launcher
    rofi-wayland
    
    # Status bar
    waybar
    
    # Screenshot tools
    grim
    slurp
    wl-clipboard
    
    # Background
    swaybg
    
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
    
    # Text editors
    gedit
    code
    
    # Browsers
    firefox
    chromium
    
    # Terminal emulators
    alacritty
    kitty
    foot
    
    # System tools
    pavucontrol
    networkmanagerapplet
    blueman
    
    # Development tools
    vscode
    jetbrains.idea-community
    
    # Office suite
    libreoffice
    
    # Archive tools with GUI
    file-roller
    
    # Calculator
    gnome-calculator
    
    # System monitor
    gnome-system-monitor
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

