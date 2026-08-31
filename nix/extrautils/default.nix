{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autoconf
    automake
    bison
    btop
    cloc
    dust
    fastfetch
    flex
    helix
    mediainfo
    mkvtoolnix-cli
    pahole
    patch
    qbittorrent
    ripgrep
    tree-sitter
    xxd
  ];
  imports = [
    ./fish
    ./lang
    ./nvim
    ./yazi
  ];
}
