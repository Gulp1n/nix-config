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
in {
  imports = [
    (coreModule "zsh")
    (coreModule "locale")
    (coreModule "git")
  ];
}