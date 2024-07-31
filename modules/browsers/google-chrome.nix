{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.google-chrome;

in {
  options.modules.google-chrome = { enable = mkEnableOption "google-chrome"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}