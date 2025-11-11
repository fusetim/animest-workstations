{ config, lib, pkgs, options, ... }:
{
  networking.timeServers = [ "192.168.1.1" ] ++ options.networking.timeServers.default; 
}