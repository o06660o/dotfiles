{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    elfutils.dev
    ncurses.dev
    openssl.dev
    pkg-config
    zlib.dev
  ];

  home.sessionVariables = {
    CPATH = "${config.home.profileDirectory}/include\${CPATH:+:$CPATH}";
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig:${config.home.profileDirectory}/share/pkgconfig\${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}";
  };
}
