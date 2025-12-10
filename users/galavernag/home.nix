{ config, pkgs, ... }:
{
  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";

  home.stateVersion = "25.11";

  home.sessionVariables = {
    NH_OS_FLAKE = "${config.home.homeDirectory}/nixos-workspace";
  };

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

  programs.home-manager.enable = true;
}
