{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  module = path: ../../modules/${path};
  coreModule = file: module "core/${file}.nix";
  devModule = file: module "dev/${file}.nix";
  terminalModule = file: module "terminal/${file}.nix";
in {
  imports = [
    (coreModule "locale")
    (coreModule "git")

    (devModule "lorri")

    (terminalModule "zsh")
    (terminalModule "comma")
  ];
}