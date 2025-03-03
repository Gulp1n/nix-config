{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home-manager.users.gulp1n = {
    services.lorri.enable = true;

    home.packages = with pkgs; [
      direnv
    ];
  };
}