{ config, lib, pkgs, ... }: {
    # Enable Nix Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}