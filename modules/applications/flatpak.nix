{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.applications.flatpak;
in
{
  options.modules.applications.flatpak = {
    enable = true;
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };

    # enable flathub
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs-stable.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
