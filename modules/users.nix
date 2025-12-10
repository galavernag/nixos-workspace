{ pkgs-stable, ... }:
{
  programs.zsh.enable = true;
  users.users.galavernag = {
    isNormalUser = true;
    description = "Guilherme Galaverna";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs-stable.zsh;
  };
}
