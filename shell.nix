{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  erlang_wx = erlangR23.override {
      wxSupport = true;
  };
in

mkShell {
  buildInputs = [ erlang_wx git libsodium ]
    ++ optional stdenv.isLinux inotify-tools;
}
