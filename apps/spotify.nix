{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.spotify.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Habilitar o Spotify.";
  };

  config = lib.mkIf config.apps.spotify.enable {
    environment.systemPackages = with pkgs; [ spotify ];
  };
}
