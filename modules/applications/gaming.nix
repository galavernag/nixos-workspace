{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.applications.gaming.steam;
in
{
  options.modules.applications.gaming.steam = {
    enable = lib.mkEnableOption "Habilita Steam";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs-stable; [
        intel-media-driver
        intel-ocl
        intel-vaapi-driver
      ];
    };

    programs = {
      steam = {
        enable = true;
        package = pkgs-stable.steam;

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;

        gamescopeSession.enable = true;
      };

      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs-stable; [
      mangohud
      protonup-qt
      # lutris
      # heroic
    ];
  };
}
