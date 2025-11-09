{ config, lib, pkgs, modulesPath, ... }:
 
{
  imports =
    [
      "${fetchTarball { url = "https://github.com/NixOS/nixos-hardware/archive/52113c4f5cfd1e823001310e56d9c8d0699a6226.zip"; sha256 = "10gxzv78vk2sy4qwxc9ijbp3pssfnf4iwixvb7kkcggrk0dndzc6";} }/raspberry-pi/4"
    ];

  # Boot sections
  boot.initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
  boot.loader.grub.enable= false;
  boot.loader.generic-extlinux-compatible.enable=true;
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  
  hardware = {
    # Apply kernel paths
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = "*rpi-4-*.dtb";
    };
    
    # Enable GPU acceleration
    raspberry-pi."4".fkms-3d.enable = true;

    # Allow redistribution of firmware
    enableRedistributableFirmware = true;

    # Disable bluetooth
    bluetooth.enable=false;
  };

  # Disable serial console
  console.enable = false;

  # Add RaspberryPi specific packages
  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];
}