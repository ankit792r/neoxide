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
    
    # Browsers
    firefox
    
    # Terminal emulators
    alacritty
    kitty
    foot
    
    # System tools
    pavucontrol
    blueman
    
    # Development tools
    vscode
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

