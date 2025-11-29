{ pkgs, inputs, ... }:
{
  # install package
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.noctalia.nixosModules.default
  ];

  services.noctalia-shell.enable = true;
}
