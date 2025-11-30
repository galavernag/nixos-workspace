{ config, pkgs, lib, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true; # Limpa imagens não usadas periodicamente
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # Emulação TPM (Necessário para Win 11)
    };
  };

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  users.users.galavernag.extraGroups = [ "libvirtd" "docker" ];
}
