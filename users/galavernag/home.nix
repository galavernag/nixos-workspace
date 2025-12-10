{ config, pkgs, nix-flatpak, ... }:
{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";

  home.stateVersion = "25.11";

  home.sessionVariables = {
    NH_OS_FLAKE = "${config.home.homeDirectory}/nixos-workspace";
  };

  programs.git = {
    enable = true;
    settings = {
      userName = "Guilherme Galaverna";
      userEmail = "guigalaverna@gmail.com";
    };
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

  services.flatpak = {
    packages = [
      "app.zen_browser.zen"
      "com.discordapp.Discord"
      "com.usebottles.bottles"
    ];
  };

  programs.home-manager.enable = true;
}
