{ config, pkgs, ... }:

{
  # Essential system services
  
  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable CUPS for printing
  services.printing.enable = true;

  # Enable avahi for network discovery
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable dbus
  services.dbus.enable = true;

  # Enable udev
  services.udev.enable = true;

  # Enable fstrim for SSD optimization
  services.fstrim.enable = true;

  # Enable automatic system upgrades (optional, can be disabled)
  # system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = false;

  # Enable NTP time synchronization
  services.timesyncd.enable = true;

  # Enable OpenSSH server
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  # Enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # Enable polkit for privilege elevation
  security.polkit.enable = true;

  # Enable doas as sudo alternative (optional)
  # security.doas.enable = true;
  # security.sudo.enable = false;
}

