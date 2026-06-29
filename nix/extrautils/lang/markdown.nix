{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mdformat
  ];
}
