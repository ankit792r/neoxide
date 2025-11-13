{ config, pkgs, ... }:

{
  # TTY-only configuration for minimal host
  # This ensures no graphical environment is loaded
  
  # Disable X11 and Wayland
  services.xserver.enable = false;
  
  # Ensure we're in multi-user.target (not graphical.target)
  systemd.defaultUnit = "multi-user.target";
  
  # Console configuration
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true;
  };

  # Essential TTY packages
  environment.systemPackages = with pkgs; [
    # Terminal multiplexers
    tmux
    screen
    
    # File managers for TTY
    ranger
    lf
    vifm
    
    # Text editors
    neovim
    vim
    nano
    
    # System monitoring
    htop
    btop
    iotop
    nethogs
    glances
    
    # Network tools
    nmap
    netcat
    mtr
    tcpdump
    
    # Disk utilities
    duf
    ncdu
    fdisk
    parted
    
    # Process management
    psmisc
    procps
    
    # Archive tools
    p7zip
    unrar
    zip
    unzip
    
    # Development tools
    gcc
    gnumake
    pkg-config
    git
    
    # Shells
    zsh
    fish
    bash
    
    # Utilities
    bat
    exa
    fd
    ripgrep
    jq
    yq
    fzf
  ];
}

