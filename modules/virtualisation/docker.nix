{
  config,
  lib,
  pkgs-stable,
  ...
}:

let
  cfg = config.modules.virtualisation.docker;
in
{
  options.modules.virtualisation.docker = {
    enable = lib.mkEnableOption "Docker e ferramentas de container";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users.galavernag.extraGroups = [ "docker" ];
    environment.systemPackages = [ pkgs-stable.docker-compose ];
  };
}
