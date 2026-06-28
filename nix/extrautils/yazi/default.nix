{ ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ./config/yazi.toml;
}
