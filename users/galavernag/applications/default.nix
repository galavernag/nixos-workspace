{
  imports = [
    ./flatpak/default.nix
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
