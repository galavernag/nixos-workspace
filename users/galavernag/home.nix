{
  pkgs,
  ...
}:
{
  imports = [
    ./modules/environment-variables.nix

    ./applications/niri/default.nix

    ./applications/alacritty.nix
    ./applications/flatpak.nix
    ./applications/git.nix
    ./applications/noctalia.nix
    # ./applications/starship.nix
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
    kdePackages.dolphin

    zed-editor
    btop
    iftop

    lm_sensors
    pciutils
    usbutils

    nil
    nixd

    fuzzel
    xwayland-satellite
  ];

  programs.home-manager.enable = true;
}
