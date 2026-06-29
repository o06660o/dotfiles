{ pkgs, ... }:

{
  home.packages = [
    (pkgs.rust-bin.stable.latest.default.override {
      extensions = [
        "rust-analyzer"
        "rust-src"
        "rustfmt"
      ];
      targets = [
        "x86_64-unknown-none"
      ];
    })
  ];
}
