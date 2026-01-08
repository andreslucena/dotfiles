{ config, pkgs, nixpkgs-stable, ... }:

{
  home.packages = with nixpkgs-stable.legacyPackages.x86_64-linux; [
    # Productivity
    # bitwarden-desktop
    ferdium

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack

    adwaita-icon-theme
    # # Media
    # vlc
    # spotify
  ];
}
