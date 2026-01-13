# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  nix-flatpak,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.displayManager.sddm.enable = true;


  systemd.tmpfiles.rules = [
    "d /media/storage 0775 seu_usuario users -"
    "d /media/games 0775 seu_usuario users -"
  ];
  system.stateVersion = "25.11"; # Did you read the comment?
}
