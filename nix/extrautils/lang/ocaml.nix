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
    LIBRARY_PATH = "${
      pkgs.lib.makeLibraryPath [
        pkgs.llvmPackages.llvm
        pkgs.zlib
      ]
    }\${LIBRARY_PATH:+:$LIBRARY_PATH}";
    OCAMLPATH = "${config.home.profileDirectory}/lib/ocaml/${pkgs.ocaml.version}/site-lib\${OCAMLPATH:+:$OCAMLPATH}";
  };
}
