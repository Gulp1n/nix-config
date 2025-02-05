{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  systemd.user.services = { 
    shadowsocks-proxy = { 
      Unit = { Description = "Local Shadowsocks proxy"; After = "network.target"; }; 
      Service = { ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -c ${config.home.homeDirectory}/.config/shadowsocks.json"; 
      ExecStop = "${pkgs.toybox}/bin/killall sslocal"; 
      }; 
    };
  }; 
}