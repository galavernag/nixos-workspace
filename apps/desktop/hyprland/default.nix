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
    description = "Enable Hyprland as the desktop environment.";
  };

  config = lib.mkIf config.desktop.hyprland.enable {
    # Enable Hyprland
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # Install Hyprland-specific portal
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };

    # Install a display manager that supports Hyprland
    # services.displayManager.sddm.wayland.enable = true;
    services.displayManager.cosmic-greeter.enable = true;

    # Fix X11 rather than Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
