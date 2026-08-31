{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    elfutils.dev
    ncurses.dev
    openssl.dev
    pkg-config
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig:${config.home.profileDirectory}/share/pkgconfig\${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}";
  };
}
