{ config, lib, pkgs, modulesPath, ... }:
{
    imports = [];
    boot.initrd.availableKernelModules = [ "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [];
    boot.extraModulePackages = [ ];
    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/79ba1da0-e213-40cc-b244-9ac8fd767d8e"; fsType = "ext4";
    };
    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/757E-B501";
    fsType = "ufat";
options = [ "fmask=0077" "dmask=0077" ];
};
swapDevices =
[{ device = "/dev/disk/by-uuid/0e7140ef-7f96-4dc7-bd29-262c3864cc67"; }];

networking.useDHCP = lib.mkDefault true;

nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
virtualisation.hypervGuest.enable = true;
}