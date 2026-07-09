{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    cmake-format
    cmake-language-server
  ];
}
