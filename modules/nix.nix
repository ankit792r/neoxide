{ config, pkgs, ... }:

{
  # Nix configuration
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "ankit" ];
    };
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    
    # Enable nix flakes - use latest unstable nix
    package = pkgs.nix;
  };

  # NixOS configuration - use current stable version
  # Update this when you upgrade to a new NixOS release
  system.stateVersion = "24.11";
}