{ config, pkgs, inputs, ... }: {
  imports = [
    # Hardware configuration (generated, may not exist)
    # ./hardware-configuration.nix
    
    # Core modules
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/networks.nix
    ../../modules/users.nix
    
    # Essential modules
    ../../modules/packages.nix
    ../../modules/services.nix
    
    # Desktop environment modules
    ../../modules/sddm.nix
    ../../modules/sddm-session.nix
    ../../modules/niri.nix
    ../../modules/desktop.nix
  ];

  # Standard host - Full desktop with niri window manager
  # Daily use configuration
}
