{ config, pkgs, nixpkgs-stable, ... }:

{
  home.packages = with nixpkgs-stable.legacyPackages.x86_64-linux; [
    # Development tools
    zellij
    devcontainer

    # Version control
    git
    gh

    # System utilities
    fish
    ripgrep
    fd
    bat
    fzf
    file
    gcc
    jq
    killall
    lazygit
    lsd
    pwgen
    unzip
    zoxide
  ];
}
