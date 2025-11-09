{
  config,
  lib,
  pkgs,
  apps,
  bootloader,
  ...
}:
{
  imports = [
    ./hardware.nix
  ];

  bootloader.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Programs
  apps.zen-browser.enable = true;
  apps.discord.enable = true;
  apps.spotify.enable = true;
  apps.vscode.enable = true;
  apps.steam.enable = true;

  desktop.cosmic.enable = false;
  desktop.hyprland.enable = true;

  apps.waybar.enable = true;

  networking.hostName = "nixos";
}
