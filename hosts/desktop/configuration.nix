{
  imports = [
    ./hardware.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "desktop";
  system.stateVersion = "25.11";
}
