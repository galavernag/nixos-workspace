{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./cosmic.nix
    ./hyprland/default.nix
    ./hyprland/waybar.nix
  ];
}
