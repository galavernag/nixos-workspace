{
  config,
  lib,
  nix-flatpak,
  ...
}:
let
  flatpakListFile = lib.strings.trim (builtins.readFile ./packages.txt);
  flatpakList = builtins.filter (s: s != "") (lib.strings.splitString "\n" flatpakListFile);

  cfg = config.modules.applications.flatpak.enable;
in
{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  options.applications.flatpak = {
    enable = lib.mkEnableOption "Habilita o suporte a Flatpak";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      packages = flatpakList;
    };
  };
}
