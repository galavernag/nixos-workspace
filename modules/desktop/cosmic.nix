{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.desktop.cosmic;
in
{
  options.modules.desktop.cosmic = {
    enable = lib.mkEnableOption "Cosmic desktop environment";
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.cosmic.enable = true;
      system76-scheduler.enable = true;
    };

    environment.cosmic.excludePackages = with pkgs-stable; [
      cosmic-player
    ];
  };
}
