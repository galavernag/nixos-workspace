{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.apps.vscode.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Visual Studio Code installation.";
  };

  config = lib.mkIf config.apps.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
