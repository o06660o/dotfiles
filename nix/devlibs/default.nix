{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    elfutils.dev
    fontconfig.dev
    fcft
    freetype.dev
    libffi.dev
    libglvnd
    libglvnd.dev
    libxcb
    libxcb.dev
    libxkbcommon
    libxkbcommon.dev
    llvmPackages_22.llvm.dev
    libxml2.dev
    ncurses.dev
    openssl.dev
    pixman
    pkg-config
    scdoc
    scdoc.dev
    wayland
    wayland.dev
    wayland-protocols
    wayland-scanner
    wayland-scanner.dev
    zlib
    zlib.dev
  ];

  home.sessionVariables = {
    CPATH = "${config.home.profileDirectory}/include\${CPATH:+:$CPATH}";
    LD_LIBRARY_PATH = "${
      pkgs.lib.makeLibraryPath [
        pkgs.libglvnd
        pkgs.libxcb
        pkgs.libxkbcommon
        pkgs.wayland
      ]
    }\${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}";
    LLVM_SYS_221_PREFIX = "${pkgs.llvmPackages_22.llvm.dev}";
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig:${config.home.profileDirectory}/share/pkgconfig\${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}";
  };
}
