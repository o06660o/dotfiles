{ pkgs, ... }:

{
  home.packages = with pkgs; [
    autoconf
    automake
    bison
    btop
    cloc
    dust
    e2tools
    fastfetch
    flex
    helix
    mediainfo
    mkvtoolnix-cli
    nushell
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
