{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home-manager.users.gulp1n = {
    programs.git = {
      enable = true;
      userName = "Gulp1n";
      userEmail = "abeldenouden@hotmail.com";
    };
    programs.gh.enable = true;

    home.packages = with pkgs; [
      lazygit
    ];
  };
}