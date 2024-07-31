{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.git;

in {
  options.modules.git = { enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    programs.git = {
    enable = true;
    userName = "Guilherme Galaverna";
    userEmail = "guigalaverna@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
  };
}