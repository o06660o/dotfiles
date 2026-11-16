{ pkgs, ... }:

{
  imports = [ ./imunes ];

  home.packages = with pkgs; [
    OVMF
    limine-full
    qemu
  ];
}
