{ config, pkgs, dotfilesPath, ... }:

{
  home.file = {
    ".config/fish/config.fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/fish/config.fish";
    };

    ".gitconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/git/gitconfig";
    };

    ".gitignore" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/git/gitignore";
    };
  };
}
