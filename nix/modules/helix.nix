{ config, pkgs, nixpkgs-unstable, ... }:

{
  home.packages = with nixpkgs-unstable.legacyPackages.x86_64-linux; [
    helix
    simple-completion-language-server  # Often used with Helix
  ];

  home.file = {
    ".config/helix/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/apereira/Software/dotfiles/helix/config.toml";
    };

    ".config/helix/languages.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/apereira/Software/dotfiles/helix/languages.toml";
    };
  };
}
