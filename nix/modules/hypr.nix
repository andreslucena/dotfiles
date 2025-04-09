{ config, pkgs, lib, ... }:

let
  hyprSource = "/home/apereira/Software/dotfiles/hypr";
in {
  home.file.".config/hypr" = {
    source = hyprSource;
    force = true;
    recursive = true;
  };

  # Log a warning to verify it's seen
  warnings = lib.mkIf (!(builtins.pathExists hyprSource)) [
    "⚠️ The path ${hyprSource} does not exist or is not accessible."
  ];

  home.packages = with pkgs; [
    alacritty
    kitty
    libnotify
    mako
    swaynotificationcenter
    networkmanagerapplet
    blueman
    playerctl
    pavucontrol
    brightnessctl
    waybar
    swww
    rofi-wayland
    hyprshot
    nwg-look
    hyprlock
    hypridle
    hyprcursor
    wl-clipboard
    wl-clipboard-x11
    wdisplays
  ];
}
