{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vscode.nix
    ./hyprland/default.nix
  ];
}
