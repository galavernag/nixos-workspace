{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."Code/User/settings.json".text = builtins.toJSON {
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontLigatures" = true;
    "editor.lineHeight" = 1.6;
    "editor.cursorStyle" = "line";
    "editor.smoothScrolling" = true;
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.codeActionsOnSave" = {
      "source.organizeImports" = "always";
      "source.fixAll.ts" = "always";
    };
    "editor.formatOnSave" = true;
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.tabSize" = 2;
    "editor.cursorBlinking" = "smooth";
    "editor.minimap.enabled" = false;

    # Window
    "window.menuBarVisibility" = "compact";
    "window.commandCenter" = false;
    "window.dialogStyle" = "custom";
    "window.titleBarStyle" = "custom";

    # Workbench
    "workbench.layoutControl.enabled" = false;
    "workbench.statusBar.visible" = false;
    "workbench.activityBar.location" = "hidden";
    "workbench.colorTheme" = "Vesper Vibrant";
    "workbench.iconTheme" = "symbols";
    "workbench.productIconTheme" = "fluent-icons";
    "workbench.list.smoothScrolling" = true;

    # Explorer
    "explorer.compactFolders" = false;

    # Chat
    "chat.commandCenter.enabled" = false;

    # Files
    "files.associations" = {
      "*.css" = "tailwindcss";
    };
    "workbench.sideBar.location" = "right";
    "[nix]" = {
      "editor.defaultFormatter" = "jnoortheen.nix-ide";
    };
  };
}
