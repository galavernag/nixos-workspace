{ inputs, pkgs-stable, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs-stable; [
    matugen
  ];

  programs.noctalia-shell.systemd.enable = true;
  programs.noctalia-shell = {
    enable = true;
  };
}
