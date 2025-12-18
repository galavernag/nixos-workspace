{
  lib,
  nix-flatpak,
  ...
}:
let
  flatpakListFile = lib.strings.trim (builtins.readFile ./packages.txt);
  flatpakList = builtins.filter (s: s != "") (lib.strings.splitString "\n" flatpakListFile);
in
{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = flatpakList;
  };
}
