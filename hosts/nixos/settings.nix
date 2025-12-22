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
      # plasma.enable = true;
      hyprland.enable = true;
      # niri.enable = true;
      # cosmic.enable = true;

      # awww.enable = true;
    };

    applications = {
      flatpak.enable = true;
      # gaming.enable = true;
    };
  };

}
