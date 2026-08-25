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
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
      "x-scheme-handler/clash" = "clash-verge.desktop";
      "x-scheme-handler/clash-verge" = "clash-verge.desktop";
    };
  };
  xdg.configFile."mimeapps.list".force = true;
  imports = [
    ./extrautils
    ./gui
    ./optutils
  ];
}
