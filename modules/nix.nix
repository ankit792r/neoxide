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
    
    # Enable nix flakes
    package = pkgs.nixVersions.stable;
  };

  # NixOS configuration
  system.stateVersion = "25.05";
}

