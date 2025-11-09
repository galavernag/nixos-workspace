{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.waybar.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Waybar for Hyprland.";
  };

  config = lib.mkIf config.apps.waybar.enable {
    programs.waybar.enable = true;
  };
}
