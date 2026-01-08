{ lib, config, pkgs, nixpkgs-unstable, ... }:

let
  hostname = builtins.getEnv "HOSTNAME";
in {
  home.username = "apereira";
  home.homeDirectory = lib.mkForce "/home/apereira";
  home.stateVersion = "24.05";

  imports =
    [
      ./modules/dotfiles.nix
      ./modules/helix.nix
      ./modules/packages-cli.nix

    ]
    ++ (if hostname == "pavement" then [
      # ./modules/specific/pavement.nix
    ] else if hostname == "carseatheadrest" then [
      # ./modules/specific/carseatheadrest.nix
      ./modules/packages-gui.nix
      ./modules/command-not-found.nix
      ./modules/kitty.nix
      ./modules/firefox.nix
      ./modules/hypr.nix
    ] else []);

  programs.home-manager.enable = true;
}
