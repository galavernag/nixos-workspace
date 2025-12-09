{ pkgs-stable, ... }: {
  environment.systemPackages = with pkgs-stable; [
    wine
    wine64
    winetricks
    wineWowPackages.waylandFull
  ];
}
