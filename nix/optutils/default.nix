{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qemu
    xorriso
  ];
}
