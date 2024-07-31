{ pkgs, ... }: {
  imports = [
    ./discord.nix
    ./beeper.nix
  ];
}