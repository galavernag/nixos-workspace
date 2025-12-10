{ nix-flaktpak, pkgs, ... }:{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "com.discordapp.Discord"
      "com.usebottles.bottles"
    ];
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
  };

  # enable flathub
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
