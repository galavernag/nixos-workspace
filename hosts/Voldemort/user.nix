{ config, lib, inputs, pkgs, ...}:

{
  imports = [ 
    ../../modules/default.nix
  ];

  config.modules = {
    asdf-vm.enable = true;

    waybar.enable = true;  
    swww.enable = true;  

    zsh.enable = true;

    rofi.enable = true;
    pywal.enable = true;

    vscode.enable = true;

    google-chrome.enable = true;

    beeper.enable = true;
    discord.enable = true;

    docker.enable = true;

    flatpak.enable = true;

    gaming.enable = true;

    git.enable = true;
    kitty.enable = true;
    warp-terminal.enable = true;

    spotify.enable = true;

    hyprland.enable = true;
  };
}

