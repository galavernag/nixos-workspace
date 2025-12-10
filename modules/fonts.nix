{ pkgs-stable, ... }: {
  fonts.packages = with pkgs-stable; [
    nerd-fonts.jetbrains-mono
  ];
}
