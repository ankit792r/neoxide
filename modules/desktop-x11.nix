{ config, pkgs, ... }:

{
  # X11-based desktop for Hyper-V compatibility
  # Use this instead of niri.nix if Wayland doesn't work in Hyper-V
  
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:escape";
    
    # Use a simple window manager instead of niri
    windowManager.awesome = {
      enable = true;
    };
    
    # Or use i3
    # windowManager.i3 = {
    #   enable = true;
    #   extraPackages = with pkgs; [
    #     i3status
    #     i3lock
    #   ];
    # };
    
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";  # or "none+i3"
    };
    
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };
  };
}