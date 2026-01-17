{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
