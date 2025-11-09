{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  inputs.nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.home-manager.url = "github:nix-community/home-manager/release-25.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    { self, nixpkgs, nixpkgs_unstable, home-manager, nixos-hardware, ... }:
    let
      unstable-module = { config, ... }: {
        nixpkgs.overlays = [
          (final: prev: {
            unstable = import nixpkgs_unstable {
              config = config.nixpkgs.config;
              system = config.nixpkgs.localSystem.system;
              overlays = [];
            };
          })
        ];
      };

      # Helper to generate hostnames phobos00..phobos99
      phobosHosts = builtins.listToAttrs (
        builtins.genList
          (i:
            let
              num = builtins.toString i;
              # zero-pad single-digit numbers
              suffix = if i < 10 then "0${num}" else num;
              hostName = "phobos${suffix}";
            in {
              name = hostName;
              value = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                specialArgs = { inherit hostName; };
                modules = [
                  ./machines/phobos.nix
                  unstable-module
                  home-manager.nixosModules.home-manager
                ];
              };
            })
          4
      );
    in {
      nixosConfigurations = phobosHosts;
    };
}
