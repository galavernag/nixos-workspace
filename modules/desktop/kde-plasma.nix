{ config, lib, ... }:
let
  cfg = config.modules.desktop.kde-plasma;
in
{
  options.modules.desktop.kde-plasma = {
    enable = lib.mkEnableOption "Ativa o KDE Plasma como ambiente.";
  };

  config = lib.mkIf cfg.enable {
    # Enable KDE Plasma
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
