{ config, pkgs, inputs, ... }:

let
  # Get niri binary path with fallback
  niriPath = 
    if inputs ? niri && inputs.niri.packages ? ${pkgs.system} then
      "${(inputs.niri.packages.${pkgs.system}.niri or inputs.niri.packages.${pkgs.system}.default)}/bin/niri"
    else
      "${pkgs.niri}/bin/niri";
in
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
        Exec=${niriPath}
        Type=Application
        DesktopNames=niri
      '';
    })
  ];
}