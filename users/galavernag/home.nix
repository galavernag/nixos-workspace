{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];


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
    flatpak
    firefox
  ];

  home.sessionVariables = {
    XDG_DATA_DIRS = "${config.home.profileDirectory}/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/local/share:/usr/share";
  };

  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
    ];
  };


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
