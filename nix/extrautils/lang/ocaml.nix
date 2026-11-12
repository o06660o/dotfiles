{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dune
    ocaml
    ocamlPackages.integers
    ocamlPackages.llvm
    ocamlPackages.menhir
    ocamlPackages.ocaml-lsp
    ocamlPackages.stdlib-shims
    ocamlformat
    opam
  ];

  home.sessionVariables = {
    OCAMLPATH = "${config.home.profileDirectory}/lib/ocaml/${pkgs.ocaml.version}/site-lib\${OCAMLPATH:+:$OCAMLPATH}";
  };
}
