{ config, pkgs, nix-flatpak, ... }:
{
  imports = [
    ./modules/environment-variables.nix

    ./applications/flatpak.nix
    ./applications/git.nix
    ./applications/starship.nix
    ./applications/zsh.nix
  ];

  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";

  home.stateVersion = "25.11";

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
