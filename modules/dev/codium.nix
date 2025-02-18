{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home-manager.users.gulp1n = {
    # VSCode config
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        vscodevim.vim
      ];
      keybindings = [
        {
          key = "ctrl+shift+`";
          command = "workbench.action.toggleMaximizedPanel";
        }
      ];
      userSettings = {
        "files.autoSave" = "afterDelay";
        "workbench.colorTheme" = "Catppuccin Latte";
        "workbench.iconTheme" = "catppuccin-latte";
        "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
        "editor.minimap.renderCharacters" = true;
        "terminal.integrated.persistentSessionReviveProcess" = "never";
        "github.gitAuthentication" = false;
        "git.terminalAuthentication" = false;

        #nix lsp
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil" = {
            "formatting" = {
              "command" = ["nixpkgs-fmt"];
            };
          };
        };
      };
    };
    programs.zsh.shellAliases = {code = "codium";};
  };
}