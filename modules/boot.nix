## this boot config is for VM machine 

{ config, ...}: 
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.initrd.kernelModules = [ "hv_vmbus" "hv_storvsc" "hv_netvsc" "hv_utils" ];
    boot.kernelModules = [ "hv_vmbus" "hv_storvsc" "hv_netvsc" "hv_utils" ];

    systemd.services.hv-kvp = {
    after = [ "sys-devices-virtual-vmbus-hv_kvp.device" "vmbus.service" ];
    wants = [ "sys-devices-virtual-vmbus-hv_kvp.device" ];
  };
}