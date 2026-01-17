{ ... }:

{
  imports = [
    ./base.nix
    ../modules/packages-gui.nix
    ../modules/command-not-found.nix
    ../modules/kitty.nix
    ../modules/firefox.nix
    ../modules/hypr.nix
  ];
}
