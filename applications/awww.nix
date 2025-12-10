{ pkgs-stable, inputs, ... }:
{
  environment.systemPackages = [
    inputs.awww.packages.${pkgs-stable.stdenv.hostPlatform.system}.awww
  ];
}
