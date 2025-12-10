{ pkgs-stable, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs-stable; [
      intel-media-driver
      intel-ocl
      intel-vaapi-driver
    ];
  };

  # enable steam
  programs = {
    steam = {
      enable = true;
      package = pkgs-stable.steam;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;

      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs-stable; [
    mangohud
    protonup-qt
    # lutris
    # heroic
  ];

  # enable gaming local streaming
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
