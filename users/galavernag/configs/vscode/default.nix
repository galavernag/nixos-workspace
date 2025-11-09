{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file.".config/Code/User/settings.json".source = ./config.json;
}
