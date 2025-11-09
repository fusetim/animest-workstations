{ config, pkgs, lib, ...}:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "xfce";
    desktopManager.xterm.enable = false;
    desktopManager.xfce.enable = true;
  };
}
