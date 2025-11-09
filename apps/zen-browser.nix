{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.zen-browser.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Habilitar o Zen Browser.";
  };

  config = lib.mkIf config.apps.zen-browser.enable {
    services.flatpak = {
      packages = [
        "app.zen_browser.zen"
      ];
    };
  };
}
