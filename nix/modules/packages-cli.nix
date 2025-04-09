{ config, pkgs, nixpkgs-unstable, ... }:

{
  home.packages = with nixpkgs-unstable.legacyPackages.x86_64-linux; [
    # Development tools
    direnv
    devenv
    zellij

    # Version control
    git
    gh

    # System utilities
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
