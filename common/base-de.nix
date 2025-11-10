{ config, pkgs, lib, ...}:

{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        greeters.slick = {
          enable = true;
          theme.name = "Zukitre-dark";
        };
      };
    };
    #displayManager.defaultSession = "xfce";
    #desktopManager.xterm.enable = false;
    desktopManager.lxqt.enable = true;
  };

  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xwinmosaic
    zuki-themes
  ];
}
