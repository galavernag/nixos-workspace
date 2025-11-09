{
  imports = [
    ./configs/default.nix
  ];

  modules = if pywalModule != null then [ pywalModule ] else [ ];

  home.username = "galavernag";
  home.homeDirectory = lib.mkForce "/home/galavernag";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    wget
    git
    discord
    spotify
    nixfmt
    orca-slicer
    parsec-bin
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
