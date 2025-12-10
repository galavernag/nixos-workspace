{ nix-flaktpak, pkgs, ... }:{
  services.flatpak = {
    enable = true;
    packages = [
      "app.zen_browser.zen"
      "com.discordapp.Discord"
      "com.usebottles.bottles"
      {
        bundle = "https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v2.3.1/OrcaSlicer-Linux-flatpak_V2.3.1_x86_64.flatpak";
        appId="io.github.softfever.OrcaSlicer";
        sha256 = "0chhgiq3rq6433s1dx7qrdds6p183bjjc00yaf09gi4yxjgrwywp";
      }
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
