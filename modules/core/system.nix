{ config, pkgs, lib, ... }: {
  services.flatpak.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.mtr.enable = true;

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
