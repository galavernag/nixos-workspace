{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.applications.gaming;
in
{
  options.modules.applications.gaming = {
    enable = lib.mkEnableOption "Habilita configurações para jogos";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs-stable; [
        intel-media-driver
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
      steam-run
      # lutris
      # heroic
    ];
  };
}
