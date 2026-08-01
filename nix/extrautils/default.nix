{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    fastfetch
    helix
    ripgrep
    tree-sitter
  ];
  imports = [
    ./fish
    ./lang
    ./nvim
    ./yazi
  ];
}
