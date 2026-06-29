{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: default nixpkgs does not offer a way to install rust toolchain binaries such as
    #       `rust-std` for `x86_64-unknown-none`. Hope we can remove this flake in the future.
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      rust-overlay,
      ...
    }:
    {
      homeConfigurations.o06660o = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [ rust-overlay.overlays.default ];
        };
        modules = [ ./home.nix ];
      };
    };
}
