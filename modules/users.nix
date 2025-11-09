{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.users = {
    galavernag = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "video"
        "audio"
      ];
    };
  };
}
