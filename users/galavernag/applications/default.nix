{
  imports = [
    ./flatpak/default.nix
    ./noctalia-shell.nix
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
