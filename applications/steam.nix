{ nixpkgs-stable, ... }: {
  programs.steam = {
    enable = true;
    package = nixpkgs-stable.steam;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
