{ 
  config,
  lib,
  pkgs,
  hostName,
  ... 
}: {

    imports = [ 
        ../common/base-de.nix
        ../common/base-networking.nix
        ../common/base-packages.nix
        ../common/flakes.nix
        ../common/i18n.nix
        ../hardware/raspberry-pi-4.nix
        ../services/openssh.nix
        # MINIMAL CONFIGURATION ABOVE

        # SERVICES BELOW
        #../services/forgejo.nix

        # AUTHORIZED USERS BELOW
        ../users/fusetim.nix
    ];

    # Networking
    networking.hostName = hostName;
    # networking.defaultGateway = "10.42.12.1";

    #networking.interfaces.ens18 = {
    #    ipv4.addresses = [{
    #        address = "10.42.12.10";
    #        prefixLength = 24;
    #    }];
    #};

    # Disk -- UPDATE THIS TO YOUR DISK CONFIGURATION
    # Especially the UUIDs, on reinstallation you will need to change these
    fileSystems."/" =
      { device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "ext4";
        options = [ "noatime" ];
      };

    swapDevices = [
      { 
        device = "/swapfile";
        size= 4096;
      }
    ];
    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "25.05"; # Did you read the comment?
}