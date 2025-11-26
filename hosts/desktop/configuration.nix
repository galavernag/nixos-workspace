{
  imports = [
    ./hardware.nix
  ];

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "desktop";
  system.stateVersion = "25.11";
}
