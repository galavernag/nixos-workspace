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

    kitty
    waybar

    fuzzel
    xwayland

    adw-gtk3
    nwg-look
    qt6Packages.qt6ct
    kdePackages.kirigami
    libsForQt5.kirigami2
    kdePackages.breeze

    mpv
  ];

  home.sessionVariables = {
    QML2_IMPORT_PATH = "${pkgs.kdePackages.kirigami}/lib/${
      pkgs.lib.replaceStrings [ "full-" ] [ "" ] pkgs.kdePackages.qtbase.name
    }/qml";
  };

  programs.home-manager.enable = true;
}
