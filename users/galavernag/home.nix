{ config, pkgs, ... }:
{
  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Guilherme Galaverna";
    userEmail = "guigalaverna@gmail.com";
  };

  home.packages = with pkgs; [
    fastfetch

    neovim

    # archives
    zip
    xz
    unzip
    p7zip

    zed-editor
    btop
    iftop

    lm_sensors
    pciutils
    usbutils
  ];

  xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/config.kdl;

  programs.home-manager.enable = true;
}
