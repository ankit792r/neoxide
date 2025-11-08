{ pkgs, ... }: {

  home = {
    username = "${config.var.username}";
    homeDirectory = "/home/${config.var.username}";
    packages = with pkgs; [
      neovim
      htop
    ];
    stateVersion = "25.05";
  };

  programs = {
    git = {
      enable = true;
      userName = "${config.var.username}";
      # userEmail = "";
    };
  };
}
