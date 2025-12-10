{ pkgs-stable, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs-stable; [
    qemu
    dnsmasq
  ];
}
