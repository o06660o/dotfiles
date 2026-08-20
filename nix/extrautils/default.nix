{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    fastfetch
    helix
    mediainfo
    mkvtoolnix-cli
    qbittorrent
    ripgrep
    tree-sitter
  ];
  imports = [
    ./fish
    ./lang
    ./mpv
    ./nvim
    ./yazi
  ];
}
