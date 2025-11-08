{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ./apps/default.nix
  ];

  apps.vscode.enable = true;

  home.username = "galavernag";
  home.homeDirectory = lib.mkForce "/home/galavernag";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    wget
    git
    discord
    spotify
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
