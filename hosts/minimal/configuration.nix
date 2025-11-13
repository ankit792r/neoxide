{ config, pkgs, inputs, ... }: {
  imports = [
    # Hardware configuration (REQUIRED - generate with: sudo nixos-generate-config --dir hosts/minimal/)
    # Uncomment the line below after generating hardware-configuration.nix
    # ./hardware-configuration.nix
    
    # Core modules
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/filesystem.nix
    ../../modules/networks.nix
    ../../modules/users.nix
    
    # Essential modules for minimal host
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/tty.nix
  ];

  # Minimal host - TTY only with essential services
  # No graphical environment
}
