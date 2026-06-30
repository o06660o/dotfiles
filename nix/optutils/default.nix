{ pkgs, ... }:

{
  home.packages = with pkgs; [
    limine-full
    qemu
  ];
}
