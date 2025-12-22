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
    packages = flatpakList ++ [
      {
        bundle = "file:///home/galavernag/Downloads/OrcaSlicer-Linux-flatpak_V2.3.1_x86_64.flatpak";
        sha256 = "0chhgiq3rq6433s1dx7qrdds6p183bjjc00yaf09gi4yxjgrwywp";
        appId = "io.github.softfever.OrcaSlicer";
      }
    ];
  };
}
