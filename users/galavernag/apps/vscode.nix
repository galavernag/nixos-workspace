{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.apps.vscode.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable VSCode with user config";
  };

  config = lib.mkIf config.apps.vscode.enable {
    home.packages = [ pkgs.vscode ];

    xdg.configFile."Code/User/settings.json".text = builtins.toJSON {
      "editor.fontSize" = 14;
      "editor.tabSize" = 2;
    };
  };
}
