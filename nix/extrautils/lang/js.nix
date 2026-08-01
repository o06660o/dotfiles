{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    prettier
    typescript
    typescript-language-server
  ];
}
