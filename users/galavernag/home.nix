{
  config,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./configs/default.nix
  ];

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

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
