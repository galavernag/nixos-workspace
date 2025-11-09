{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vscode/default.nix
    ./hyprland/default.nix
    ./waybar/default.nix
  ];
}
