{ config, pkgs, inputs, ... }: {
  imports = [
    # Hardware configuration (generated, may not exist)
    # ./hardware-configuration.nix
    
    # Core modules
    ../../modules/nix.nix
    ../../modules/boot.nix
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
