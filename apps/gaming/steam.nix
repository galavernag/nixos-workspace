{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.steam.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Steam gaming platform.";
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
