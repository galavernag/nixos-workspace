{
  config,
  lib,
  pkgs,
  ...
}:
{

  options.apps.steam.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Steam";
  };

  config = lib.mkIf config.apps.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    programs.gamemode.enable = true;
  };
}
