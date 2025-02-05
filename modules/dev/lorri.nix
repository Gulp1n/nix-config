{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  services.lorri.enable = true;

  home-manager.users.gulp1n.home.packages = with pkgs; [
    direnv
  ];
}