{
  config,
  lib,
  pkgs,
  ...
}:

{

  home.username = "galavernag";
  home.homeDirectory = lib.mkForce "/home/galavernag";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    wget
    git
    discord
    spotify
    vscode
    nixfmt
    orca-slicer
    parsec-bin
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
