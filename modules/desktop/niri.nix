{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.desktop.niri;
in
{
  options.modules.desktop.niri = {
    enable = lib.mkEnableOption "Habilita o Niri";
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
  };
}
