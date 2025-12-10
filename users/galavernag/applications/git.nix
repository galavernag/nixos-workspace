{ config, home, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Guilherme Galaverna";
        email = "guigalaverna@gmail.com";
      };
    };
  };
}
