{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        # opacity = 0.8;
        # blur = true;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };
    };
  };
}
