{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    sideloadInitLua = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      gitsigns-nvim
      nvim-autopairs
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      tokyonight-nvim
      vim-lastplace
    ];
  };
  xdg.configFile."nvim".source = ./config;
}
