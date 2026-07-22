{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dune
    ocaml
    ocamlPackages.ocaml-lsp
    ocamlPackages.menhir
    ocamlformat
    opam
  ];
}
