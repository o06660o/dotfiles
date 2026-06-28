{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    sideloadInitLua = true;
    extraPackages = [ pkgs.git ];
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      nvim-autopairs
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      tokyonight-nvim
      vim-lastplace
    ];
  };
  xdg.configFile."nvim".source = ./config;
}
