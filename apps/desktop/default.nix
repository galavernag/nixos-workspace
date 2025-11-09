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
  ];
}
