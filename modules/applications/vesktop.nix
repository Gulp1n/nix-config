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
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home-manager/dotconfig/vesktop/";
      target = "vesktop/";
    };
  };
}