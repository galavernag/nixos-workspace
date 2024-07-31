{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.tofi;

in {
  options.modules.tofi = { enable = mkEnableOption "tofi"; };
  config = mkIf cfg.enable {
    programs.tofi = {
      enable = true;
      settings = {
        width = "100%";
        height = "100%";
        border-width = "0";
        outline-width = "0";
        padding-left = "35%";
        padding-top = "35%";
        result-spacing = "25";
        num-results = "5";
        font = "monospace";
        background-color = "#000A";
      };
    };
  };
}