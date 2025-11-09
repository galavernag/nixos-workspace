{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vscode/default.nix
    ./pywal.nix
  ];
}
