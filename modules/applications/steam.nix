{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: {
  programs.steam = {
    enable = true;
  };  
  home-manager.users.gulp1n = {};
}