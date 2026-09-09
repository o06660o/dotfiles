{ pkgs, ... }:

{
  home.packages = [
    (pkgs.rust-bin.selectLatestNightlyWith (
      toolchain:
      toolchain.default.override {
        extensions = [
          "rust-analyzer"
          "rust-src"
          "rustfmt"
        ];
        targets = [
          "x86_64-unknown-none"
          "x86_64-unknown-linux-musl"
        ];
      }
    ))
  ];
}
