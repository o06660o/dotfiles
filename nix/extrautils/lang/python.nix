{ pkgs, ... }:

{
  home.packages = with pkgs; [
    black
    pyright
    python3
    uv
  ];
}
