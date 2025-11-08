{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.docker.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Docker with user config";
  };

  config = lib.mkIf config.apps.docker.enable {
    home.packages = [
      pkgs.docker
      pkgs.docker-compose
    ];
  };
}
