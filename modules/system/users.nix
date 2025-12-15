{ pkgs-stable, ... }:
{
  programs.zsh.enable = true;
  users.users.galavernag = {
    isNormalUser = true;
    description = "Guilherme Galaverna";
    hashedPassword = "$y$j9T$3bl3g3hsLzOFeEPCnKhMu0$nBg9jPO7XriJ21q/1OoiLcCCUodcDRm04HrzFTyQUA.";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs-stable.zsh;
  };
}
