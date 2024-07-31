{ pkgs, ... }: {
  imports = [
    ./brave.nix
    ./firefox.nix
    ./google-chrome.nix
  ];
}