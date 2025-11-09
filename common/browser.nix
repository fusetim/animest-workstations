{ config, pkgs, lib, ... }:
{
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      languages = [ "fr" "en" ];
    };
}