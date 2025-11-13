{ pkgs, ... }:

{
  # Essential system packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    coreutils
    findutils
    gnugrep
    gnused
    gnutar
    gzip
    bzip2
    xz
    zip
    unzip
    
    # System tools
    util-linux
    procps
    psmisc
    which
    file
    tree
    wget
    curl
    git
    rsync
    
    # Text editors
    neovim
    vim
    
    # System monitoring
    htop
    btop
    iotop
    nethogs
    
    # Network tools
    iputils
    bind
    nmap
    tcpdump
    
    # Archive tools
    p7zip
    unrar
    
    # Development tools
    gcc
    gnumake
    pkg-config
    
    # Shell utilities
    bash
    zsh
    fish
    
    # File managers
    ranger
    lf
    
    # Process management
    tmux
    screen
  ];
}

