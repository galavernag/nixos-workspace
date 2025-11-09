{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.bootloader.systemd.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Habilitar o systemd como sistema de inicialização.";
  };

  config = lib.mkIf config.bootloader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
