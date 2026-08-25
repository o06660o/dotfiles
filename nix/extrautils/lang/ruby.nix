{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ruby
    rubyPackages.rubocop
    rubyPackages.solargraph
  ];
}
