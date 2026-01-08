{ config, pkgs, nixpkgs-unstable, ... }:

{
  home.packages = with nixpkgs-unstable.legacyPackages.x86_64-linux; [
    # Productivity
    bitwarden-desktop
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
