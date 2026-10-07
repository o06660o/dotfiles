{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    llvmPackages_22.clang
    llvmPackages_22.clang-tools
    (lib.hiPrio gcc)
    llvmPackages_22.lld
    llvmPackages_22.llvm
    meson
    ninja
    pkgsStatic.stdenv.cc
  ];
}
