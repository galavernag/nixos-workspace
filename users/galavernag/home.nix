{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.noctalia.homeModules.default
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

  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here; defaults will
      # be deep merged with these attributes.
      bar = {
        density = "compact";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "SidePanelToggle";
              useDistroLogo = true;
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Monochrome";
      general = {
        avatarImage = "/home/galavernag/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = false;
        name = "São Paulo, Brazil";
      };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
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
