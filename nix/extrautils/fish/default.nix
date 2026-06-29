{ ... }:

{
  programs.fish.enable = true;
  xdg.configFile."fish/conf.d/extrautils.fish".source = ./config/config.d/extrautils.fish;
  xdg.configFile."fish/functions/fish_prompt.fish".source = ./config/functions/fish_prompt.fish;
  xdg.configFile."fish/functions/v.fish".source = ./config/functions/v.fish;
}
