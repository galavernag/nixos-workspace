{
  config,
  home,
  nix-flatpak,
  ...
}:
{
  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    packages = [
      "app.zen_browser.zen"
      "com.discordapp.Discord"
      "com.usebottles.bottles"
      "org.vinegarhq.Sober"
    ];
  };
}
