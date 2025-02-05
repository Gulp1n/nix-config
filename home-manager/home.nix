# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./snake.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "gulp1n";
    homeDirectory = "/home/gulp1n";
  };

  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    # basic opperation
    firefox-devedition
    neofetch
    kitty

    # coding
    lazygit
    neovim
    nil # nix lsp
    direnv  

    # communication
    zapzap # WhatsApp
    vesktop

    #productivity
    parsec-bin
    onlyoffice-bin
    onedriver

    #media
    vlc
    ffmpeg
    spotify

    #entertainment
    prismlauncher
    openttd
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

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
  home-manager.users.gulp1n.programs.zsh.shellAliases = {code = "codium";};

  #Dotfiles
  xdg.configFile.Vencord = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home-manager/dotconfig/vesktop/";
    target = "vesktop/";
  };
  xdg.configFile.kitty = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home-manager/dotconfig/kitty/";
    target = "kitty/";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
