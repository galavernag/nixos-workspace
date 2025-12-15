{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
in
{
  options.modules.desktop.hyprland = {
    enable = lib.mkEnableOption "Habilita o Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
