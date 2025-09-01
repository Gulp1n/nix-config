{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: {
  
  home-manager.users.gulp1n = {
    home.packages = with pkgs; [
      jetbrains.idea-ultimate
    ];
  };
}