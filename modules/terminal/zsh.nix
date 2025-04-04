{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  home-manager.users.gulp1n = {
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
            "direnv"
        ];
      };

      shellAliases = {
        ls = "eza -lh";
        la = "eza -lah";
        shutdown = "systemctl poweroff";
        reboot = "systemctl reboot";
        vim = "nvim";
        lgit = "lazygit";
      };
    };

    home.packages = with pkgs; [
      eza
      dust
    ];
  };
}