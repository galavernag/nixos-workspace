# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.users.galavernag = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      nerd-fonts.jetbrains-mono
      tmux
    ];
  };

  virtualisation.docker.enable = true;
}
