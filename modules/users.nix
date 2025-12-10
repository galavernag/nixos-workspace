{ pkgs-stable, ...}: {
  programs.zsh.enable = true;
  users.users.galavernag = {
    isNormalUser = true;
    description = "Guilherme Galaverna";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs-stable.zsh;
  };
}
