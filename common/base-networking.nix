{ config, lib, pkgs, ...}: {
  
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.enableIPv6 = false;

  # Enable the firewall
  networking.firewall.enable = true;

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Disable WiFi
  networking.wireless.enable = false;
}