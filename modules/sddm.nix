{ config, pkgs, ... }:

{
  # SDDM Display Manager configuration for Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "maldives";
    settings = {
      Theme = {
        CursorTheme = "Adwaita";
        Font = "Noto Sans, 10";
      };
      General = {
        Numlock = "on";
      };
    };
  };

  # Enable X11 for compatibility (some apps may need it)
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:escape";
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };
  };

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      font-awesome
      fira-code
    ];
  };
}

