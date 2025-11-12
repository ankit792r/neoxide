## this boot config is for VM machine 

{ config, ...}: 
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}