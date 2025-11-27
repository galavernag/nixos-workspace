{ pkgs, ... }:
{
  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fastfetch
    btop
    unzip
    zip
    spotify
    discord
    kitty
    wofi
    zed-editor
    fuzzel
    firefox
  ];

  ## Hyprland
  programs.kitty.enable = true; # required for the default Hyprland config
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
