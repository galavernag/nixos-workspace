{
  lib,
  nix-flatpak,
  ...
}:
let
  flatpakListFile = lib.strings.trim (builtins.readFile ./packages.txt);
  flatpakList = builtins.filter (s: s != "") (lib.strings.splitString "\n" flatpakListFile);

  orcaSlicer = {
    hash = "0chhgiq3rq6433s1dx7qrdds6p183bjjc00yaf09gi4yxjgrwywp";
    url = "https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v2.3.1/OrcaSlicer-Linux-flatpak_V2.3.1_x86_64.flatpak";
    appId = "io.github.softfever.OrcaSlicer";
  };

  orcaSlicerBundleFile = builtins.fetchurl {
    url = orcaSlicer.url;
    sha256 = orcaSlicer.hash;
  };
in
{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = flatpakList ++ [
      {
        bundle = orcaSlicerBundleFile;
        sha256 = orcaSlicer.hash;
        appId = orcaSlicer.appId;
      }
    ];
  };
}
