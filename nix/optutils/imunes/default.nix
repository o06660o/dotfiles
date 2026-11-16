{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (callPackage ./package.nix { })
    imagemagick
    iproute2
    jq
    socat
    tcl
    tclPackages.tcllib
    tk
    wireshark
    xterm
  ];
}
