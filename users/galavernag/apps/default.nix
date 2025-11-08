{ config, lib, ... }:
{
  imports = [
    ./vscode.nix
    ./docker.nix
  ];
}
