{ ... }:

{
  home = {
    username = "o06660o";
    homeDirectory = "/home/o06660o";
    stateVersion = "26.05";
  };
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  imports = [
    ./extrautils
    ./gui
    ./mimeapps.nix
    ./optutils
  ];
}
