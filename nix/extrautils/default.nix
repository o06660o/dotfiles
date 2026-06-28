{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    cloc
    dust
    ripgrep
  ];
  imports = [
    ./lang
    ./nvim
  ];
}
