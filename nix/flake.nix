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
      pkgs = nixpkgs-stable.legacyPackages.${system};

      # Helper to create home-manager configurations
      mkHome = { profile, username ? "apereira", dotfilesPath ? "/home/${username}/Software/dotfiles" }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/${profile}.nix ];
          extraSpecialArgs = {
            inherit inputs username dotfilesPath;
          };
        };
    in
    {
      # NixOS configuration (uses desktop profile)
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
            home-manager.users.apereira = import ./profiles/desktop.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              username = "apereira";
              dotfilesPath = "/home/apereira/Software/dotfiles";
            };
          }
        ];
      };

      # Home Manager configurations
      homeConfigurations = {
        # Default desktop profile
        apereira = mkHome {
          profile = "desktop";
        };

        # Devcontainer profile (CLI only, vscode user)
        devcontainer = mkHome {
          profile = "devcontainer";
          username = "vscode";
          dotfilesPath = "/home/vscode/dotfiles";
        };
      };

      # Development shell
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [];
      };
    };
}
