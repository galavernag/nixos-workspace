{ config, ... }:
{
  home.sessionVariables = {
    NH_OS_FLAKE = "${config.home.homeDirectory}/nixos-workspace";
    EDITOR = "nvim";
  };
}
