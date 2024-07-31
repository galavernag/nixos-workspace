{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.asdf-vm;

in {
  options.modules.asdf-vm = { enable = mkEnableOption "asdf-vm"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      asdf-vm   
    ]; 
  };
}