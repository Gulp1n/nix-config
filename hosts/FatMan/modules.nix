{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  module = path: ../../modules/${path};
  coreModule = module "core/${file}.nix";
in {
  imports = [
    (coreModule "zsh")
    (coreModule "locale")
  ]
}