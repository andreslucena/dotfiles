{ config, pkgs, dotfilesPath, ... }:

{
  home.packages = with pkgs; [
    helix
    simple-completion-language-server
  ];

  home.file = {
    ".config/helix/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/helix/config.toml";
    };

    ".config/helix/languages.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/helix/languages.toml";
    };
  };
}
