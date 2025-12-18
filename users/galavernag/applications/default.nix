{
  imports = [
    ./flatpak/default.nix
    ./alacritty.nix
    ./git.nix
    ./zsh.nix
  ];

  # definindo programas
  programs = {
    git.enable = true;
    git.settings = {
      user = {
        name = "Guilherme Galaverna";
        email = "guigalaverna@gmail.com";
      };
    };

    zsh.enable = true;
  };

}
