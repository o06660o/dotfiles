{ pkgs, ... }:

{
  home.packages = with pkgs; [
    OVMF.fd
    limine-full
    qemu
  ];
}
