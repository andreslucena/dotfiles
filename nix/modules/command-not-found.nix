{ config, pkgs, ... }:

{
  programs.command-not-found.enable = false;
  
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
