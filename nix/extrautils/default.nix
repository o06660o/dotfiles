{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    ripgrep
  ];
  imports = [
    ./fish
    ./lang
    ./nvim
    ./yazi
  ];
}
