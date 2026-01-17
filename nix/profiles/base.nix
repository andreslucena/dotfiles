{ lib, config, pkgs, username, dotfilesPath, ... }:

{
  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";
  home.stateVersion = "25.11";

  imports = [
    ../modules/dotfiles.nix
    ../modules/helix.nix
    ../modules/packages-cli.nix
  ];

  programs.home-manager.enable = true;
}
