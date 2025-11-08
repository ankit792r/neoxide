{ config, pkgs, ... }: {
  users.users.ankit = {
    isNormalUser = true;
    description = "main non root user";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    packages = with pkgs; [
      neovim
      htop
      curl
    ];
  };
}
