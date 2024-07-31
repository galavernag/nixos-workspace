{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.beeper;

in {
  options.modules.beeper = { enable = mkEnableOption "beeper"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      beeper
    ];
  };
}