{ pkgs, ... }:
{
  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    btop
    unzip
    zip
    spotify
    discord
  ];

  programs.git = {
    enable = true;
    userName = "Guilherme Galaverna";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.home-manager.enable = true;
}
