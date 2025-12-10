{ pkgs-stable, ... }: {
  fonts = {
    packages = with pkgs-stable; [
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrains Mono Nerd Font"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
