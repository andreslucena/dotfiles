{ config, pkgs, ... }:

{
  home.file = {
    ".config/fish/config.fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/apereira/Software/dotfiles/fish/config.fish";
    };

    ".gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/apereira/Software/dotfiles/git/gitconfig";
    };

    ".gitignore" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/apereira/Software/dotfiles/git/gitignore";
    };
  };
}
