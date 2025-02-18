{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: {
  
  home-manager.users.gulp1n = {config, specialArgs, ...}: {
    home.packages = with pkgs; [
      vesktop
    ];

    xdg.configFile.vesktop = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${specialArgs.rootPath}/home-manager/dotconfig/vesktop/";
      target = "vesktop/";
    };
  };
}