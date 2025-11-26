{
  home.username = "galavernag";
  home.homeDirectory = "/home/galavernag";

  home.packages = with pkgs; [
    fastfetch
    btop
    unzip
    zip
    spotify
    discord
    kitty
  ];

  programs.hyprland.enable = true;

  programs.git = {
    enable = true;
    userName = "Guilherme Galaverna";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.home-manager.enable = true;
}
