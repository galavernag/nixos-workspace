{
  config,
  lib,
  pkgs-stable,
  inputs,
  ...
}:
let
  cfg = config.modules.desktop.awww;
  awww = inputs.awww.packages.${pkgs-stable.stdenv.hostPlatform.system}.awww;
in
{
  options.modules.desktop.awww = {
    enable = lib.mkEnableOption "Habilita awww";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      awww
    ];

    systemd.user.services.awww-daemon = {
      enable = true;
      description = "awww daemon";
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${awww}/bin/awww-daemon";
      };
    };
  };
}
