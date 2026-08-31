{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    (lib.hiPrio gcc)
    lld
    llvm
    meson
    ninja
    pkgsStatic.stdenv.cc
  ];
}
