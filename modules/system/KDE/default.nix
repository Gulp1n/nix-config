{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: {
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Remove KDE bloat
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    elisa
    kwallet
  ];
}