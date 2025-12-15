{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.virtualisation.wine;
in
{
  options.modules.virtualisation.wine = {
    enable = lib.mkEnableOption "Wine + Winetricks";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs-stable; [
      wine
      wine64
      winetricks
      wineWowPackages.waylandFull
    ];
  };
}
