{
  config,
  lib,
  pkgs,
  ...
}:
{
  pywal-nix = {
    wallpaper = "${config.home.homeDirectory}/.wallpapers/current-wallpaper.jpg";
    light = false;
    backend = "wal";

    enableKittyIntegration = true;
  };

  home.packages = [
    (pkgs.writeShellScriptBin "colour-scheme-sample" ''
      echo '${config."pywal-nix".colourScheme.wallpaper}'
      echo '${config."pywal-nix".colourScheme.special.background}'
      echo '${config."pywal-nix".colourScheme.colours.colour9}'
    '')
  ];
}
