{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
