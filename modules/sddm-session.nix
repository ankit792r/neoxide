{ config, pkgs, ... }:

{
  # Create SDDM session file for niri
  # This ensures niri appears as a session option in SDDM
  
  # Create wayland session desktop entry
  environment.systemPackages = with pkgs; [
    (pkgs.writeTextFile {
      name = "niri-wayland-session";
      destination = "/share/wayland-sessions/niri.desktop";
      text = ''
        [Desktop Entry]
        Name=Niri
        Comment=Niri Wayland Compositor
        Exec=niri
        Type=Application
        DesktopNames=niri
      '';
    })
  ];
}

