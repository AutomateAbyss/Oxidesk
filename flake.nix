{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane = {
      url = "github:ipetkov/crane";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, crane, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import inputs.rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        craneLib = crane.lib.${system};
      in
      with pkgs;
    {
      packages.default = craneLib.buildPackage {
        src = craneLib.cleanCargoSource ./.;

        # Add extra inputs here or any other derivation settings
        # doCheck = true;
        # buildInputs = [];
        # nativeBuildInputs = [];
      };
      devShells.default = mkShell {
          nativeBuildInputs = [
            clangStdenv
            trunk
            openssl_3
            pkg-config
            wasm-bindgen-cli
            (rust-bin.selectLatestNightlyWith (
              toolchain: toolchain.default.override{
                extensions = [ "rust-src" "rust-analyzer" "clippy"];
                targets = ["x86_64-unknown-linux-gnu" "wasm32-unknown-unknown" ];
            }))
          ];
          shellHook = ''cargo install sea-orm-cli --no-default-features --features "async-std runtime-actix-rustls cli codegen"'';
      };
    });
}
