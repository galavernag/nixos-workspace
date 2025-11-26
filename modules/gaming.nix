{ config, pkgs, lib, username, ... }:
let
  cfg = config.modules.gaming;
in {
  options.modules.gaming.enable = lib.mkEnableOption "Habilita configurações para jogos";

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };

    programs.steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      goverlay
      protonup-qt
      bottles
    ];

    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
  };
}
