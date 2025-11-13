{ pkgs, inputs, ... }: {

  home = {
    username = "ankit";
    homeDirectory = "/home/ankit";
    stateVersion = "24.11";
  };

  # Essential packages for minimal TTY setup
  home.packages = with pkgs; [
    # Text editors
    neovim
    vim
    nano
    
    # System monitoring
    htop
    btop
    iotop
    glances
    
    # Terminal multiplexers
    tmux
    screen
    
    # File managers
    ranger
    lf
    vifm
    
    # Development tools
    git
    gcc
    gnumake
    pkg-config
    
    # Utilities
    bat
    exa
    fd
    ripgrep
    fzf
    jq
    yq
    curl
    wget
    
    # Shells
    zsh
    fish
  ];

  programs = {
    # Git configuration
    git = {
      enable = true;
      userName = "ankit";
      # userEmail = "your-email@example.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    # Neovim configuration
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    # Zsh configuration
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" ];
        theme = "robbyrussell";
      };
    };

    # Tmux configuration
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      terminal = "screen-256color";
      extraConfig = ''
        set -g mouse on
        set -g base-index 1
        setw -g pane-base-index 1
      '';
    };

    # Starship prompt (optional, modern prompt)
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "$all$character";
      };
    };
  };
}
