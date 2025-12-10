{ pkgs-unstable, inputs, ... }:
{
  services.noctalia-shell.enable = true;
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs-unstable.stdenv.hostPlatform.system}.default
  ];
}
