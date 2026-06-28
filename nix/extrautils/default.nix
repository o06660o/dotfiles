{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    fastfetch
    ripgrep
  ];
  imports = [
    ./fish
    ./lang
    ./nvim
    ./yazi
  ];
}
