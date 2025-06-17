{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: {
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  # Remove KDE bloat
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
    kwallet
  ];
}