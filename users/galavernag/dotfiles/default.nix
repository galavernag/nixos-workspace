{
  imports = [
    ./environment-variables.nix
  ];

  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;

    "hypr/hyprland.conf".source = ./hypr/hyprland.conf;

    "kitty/kitty.conf".source = ./kitty/kitty.conf;

    "noctalia-shell/settings.json".source = ./noctalia-shell/settings.json;

    "niri/config.kdl".source = ./niri/config.kdl;
  };
}
