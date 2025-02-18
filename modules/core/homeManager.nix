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
    home = {
      username = "gulp1n";
      homeDirectory = "/home/gulp1n";
      stateVersion = "24.05";
	  };

    # Enable home-manager
    programs.home-manager.enable = true;
  };
}