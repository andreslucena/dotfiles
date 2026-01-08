{
  description = "Multi-system Nix configuration";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ nixpkgs-stable, nixos-hardware, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "apereira";
      pkgs = nixpkgs-stable.legacyPackages.${system};
    in
    {
      # NixOS configuration
      nixosConfigurations.default = nixpkgs-stable.lib.nixosSystem {
        inherit system;
        modules = [
          (if builtins.pathExists "/etc/nixos/configuration.nix"
           then /etc/nixos/configuration.nix 
           else {})
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home.nix;
            home-manager.extraSpecialArgs = { 
              inherit inputs nixpkgs-stable;
            };
          }
        ];
      };

      # Home Manager configuration
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = { 
          inherit inputs nixpkgs-stable;
        };
      };

      # Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # Add your dev tools here
        ];
      };
    };
}
