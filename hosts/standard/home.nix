{ pkgs, ... }: {

  home = {
    username = "ankit";
    homeDirectory = "/home/ankit";
    packages = with pkgs; [
      neovim
      htop
    ];
    stateVersion = "25.05";
  };

  programs = {
    git = {
      enable = true;
      userName = "ankit";
      # userEmail = "";
    };
  };
}
