{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.discord.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Habilitar o Discord.";
  };

  config = lib.mkIf config.apps.discord.enable {
    environment.systemPackages = with pkgs; [ discord ];
  };
}
