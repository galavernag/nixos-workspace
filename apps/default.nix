{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./gaming/default.nix
    ./development/default.nix
    ./desktop/default.nix
    ./discord.nix
    ./spotify.nix
    ./zen-browser.nix
  ];
}
