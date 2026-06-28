{ ... }:

{
  home = {
    username = "o06660o";
    homeDirectory = "/home/o06660o";
    stateVersion = "26.05";
  };
  programs.home-manager.enable = true;
  imports = [ ./extrautils ];
}
