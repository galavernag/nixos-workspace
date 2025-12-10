{ pkgs-unstable, ... }:
{
  environment.systemPackages = [
    pkgs-unstable.orca-slicer
  ];
}
