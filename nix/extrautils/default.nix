{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    fastfetch
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
