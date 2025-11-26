{ config, pkgs, lib, username, ... }:
let
  cfg = config.modules.virtualisation;
in {
  options.modules.virtualisation.enable = lib.mkEnableOption "Habilita a virtualização (KVM/QEMU + Docker)";

  config = lib.mkIf cfg.enable {
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
    users.users."${username}".extraGroups = [ "libvirtd" "docker" ];
  };
}
