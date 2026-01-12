{
  pkgs,
  ...
}:
{
  imports = [
    ./dotfiles/default.nix

    ./applications/default.nix
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

  ];

  #home.sessionVariables = {
  #  QML2_IMPORT_PATH = "${pkgs.kdePackages.kirigami}/lib/${
  #    pkgs.lib.replaceStrings [ "full-" ] [ "" ] pkgs.kdePackages.qtbase.name
  #  }/qml";
  #};

  programs.home-manager.enable = true;
}
