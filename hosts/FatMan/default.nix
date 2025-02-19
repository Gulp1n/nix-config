# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.default
	  inputs.home-manager.nixosModules.home-manager
    ./modules.nix
  ];
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = "gulp1n";
  };
  
	networking.hostName = "FatMan";

  environment.systemPackages = with pkgs; [
    wget
  ];
	

  programs.nix-ld = {
		enable = true;
		package = pkgs.nix-ld-rs; # only for NixOS 24.05
	};
	
	nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };
	
	
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}