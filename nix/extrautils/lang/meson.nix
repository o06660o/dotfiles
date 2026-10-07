{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mesonlsp
  ];
}
