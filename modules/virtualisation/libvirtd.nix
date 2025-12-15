{
  config,
  lib,
  pkgs-stable,
  ...
}:
let
  cfg = config.modules.virtualisation.libvirtd;
in
{
  options.modules.virtualisation.libvirtd = {
    enable = lib.mkEnableOption "Libvirtd, QEMU/KVM, Virt-manager";
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    virtualisation.libvirtd.qemu = {
      swtpm.enable = true;
      ovmf.packages = [ pkgs-stable.OVMFFull.fd ];
    };

    environment.systemPackages = with pkgs-stable; [
      dnsmasq
    ];

    users.users.galavernag.extraGroups = [ "libvirtd" ];
  };
}
