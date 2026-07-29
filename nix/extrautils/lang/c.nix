{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    (lib.hiPrio gcc)
    llvm
    ninja
  ];
}
