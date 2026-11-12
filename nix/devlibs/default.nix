{ config, pkgs, ... }:

let
  alsa = pkgs.alsa-lib-with-plugins.override {
    plugins = with pkgs; [
      alsa-plugins
      pipewire
    ];
  };
in
{
  home.packages = with pkgs; [
    alsa
    alsa.dev
    elfutils.dev
    fontconfig.dev
    fcft
    freetype.dev
    libdrm.dev
    libffi.dev
    libglvnd
    libglvnd.dev
    libuuid
    libuuid.dev
    libuuid.lib
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
    vulkan-loader
    wayland
    wayland.dev
    wayland-protocols
    wayland-scanner
    wayland-scanner.dev
    zlib
    zlib.dev
    zstd.dev
  ];

  home.sessionVariables = {
    CPATH = "${config.home.profileDirectory}/include\${CPATH:+:$CPATH}";
    LD_LIBRARY_PATH = "${
      pkgs.lib.makeLibraryPath [
        alsa
        pkgs.libuuid.lib
        pkgs.libxcb
        pkgs.libxkbcommon
        pkgs.wayland
        pkgs.vulkan-loader
      ]
    }\${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}";
    LIBCLANG_PATH = "${pkgs.llvmPackages_22.libclang.lib}/lib";
    # Let native linkers find libraries installed in the Home Manager profile.
    LIBRARY_PATH = "${config.home.profileDirectory}/lib:${
      pkgs.lib.makeLibraryPath [
        pkgs.llvmPackages.llvm
        pkgs.zlib
      ]
    }\${LIBRARY_PATH:+:$LIBRARY_PATH}";
    LLVM_SYS_221_PREFIX = "${pkgs.llvmPackages_22.llvm.dev}";
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig:${config.home.profileDirectory}/share/pkgconfig\${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}";
  };
}
