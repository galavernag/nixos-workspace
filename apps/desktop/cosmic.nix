{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.desktop.cosmic.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Cosmic desktop environment.";
  };

  config = lib.mkIf config.desktop.cosmic.enable {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
  };
}
