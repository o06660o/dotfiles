{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bear
    gnumake
    mbake
  ];
}
