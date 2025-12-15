{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.desktop.plasma;
in
{
  options.modules.desktop.plasma = {
    enable = lib.mkEnableOption "Habilita KDE Plasma";
  };

  config = lib.mkIf cfg.enable {
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
