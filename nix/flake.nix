{
  description = "NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = inputs@{ nixpkgs-unstable, nixos-hardware, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "apereira";

      baseModules =
        if builtins.pathExists "/etc/nixos/configuration.nix"
        then [ /etc/nixos/configuration.nix ]
        else [ ];

    in {
      nixosConfigurations.default = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        modules = baseModules ++ [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit nixpkgs-unstable;
            };

            home-manager.users.apereira = import ./home-manager.nix;
          }
        ];
      };
    };
}
