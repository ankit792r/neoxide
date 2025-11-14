{ config, pkgs, inputs, ... }:
{
  imports = [
    # Hardware configuration (REQUIRED - generate with: sudo nixos-generate-config --dir hosts/standard/)
    # Uncomment the line below after generating hardware-configuration.nix
    ./hardware-configuration.nix
    
    # Hyper-V guest support (uncomment if running in Hyper-V)
    ../../modules/hyperv.nix
    
    # Core modules
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/filesystem.nix
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