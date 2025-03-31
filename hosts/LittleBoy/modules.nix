{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  specialArgs,
  ...
}: let
  module = path: ../../modules/${path};
  coreModule = file: module "core/${file}.nix";
  devModule = file: module "dev/${file}.nix";
  terminalModule = file: module "terminal/${file}.nix";
  applicationsModule = file: module "applications/${file}.nix";
  DEModule = file: module "system/${file}";
in {
  imports = [
    (coreModule "locale")
    (coreModule "git")
    (coreModule "homeManager")

    (devModule "lorri")
    (devModule "codium")
    (devModule "rustRover")

    (terminalModule "zsh")
    (terminalModule "comma")

    (applicationsModule "vesktop")
    (applicationsModule "steam")

    (DEModule "KDE")
  ];
}