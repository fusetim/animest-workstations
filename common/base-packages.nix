{ config, lib, pkgs, ... }: {
    # Base packages for all machines
    environment.systemPackages = with pkgs; [
        nano
        curl 
        wget
        git
        vim
        htop
        tree
        unzip
        zip
    ];

    home-manager.useGlobalPkgs = true;
}