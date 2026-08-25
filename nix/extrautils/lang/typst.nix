{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libertine
    tinymist
    typst
    typstyle
  ];
}
