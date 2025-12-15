{
  imports = [
    ./system.nix
  ];

  modules = {
    virtualisation = {
      docker.enable = true;
      libvirtd.enable = true;
      wine.enable = true;
    };

    desktop = {
      plasma.enable = true;
    };

    applications = {
      flatpak.enable = true;
      gaming.enable = true;
    };
  };

}
