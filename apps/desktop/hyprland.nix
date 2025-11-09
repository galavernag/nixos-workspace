{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.desktop.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Hyprland.";
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    programs.hyprland.enable = true;

    services.displayManager.cosmic-greeter.enable = true;
    environment.systemPackages = [
      pkgs.kitty # required for the default Hyprland config
      pkgs.waybar
      pkgs.wofi
    ];
  };
}
