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
in {
  imports = [
    (coreModule "zsh")
    (coreModule "locale")
    (coreModule "git")

    (devModule "lorri")
  ];
}