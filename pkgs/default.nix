final: prev:
let
  sources = import ./_sources/generated.nix { inherit (final) fetchurl fetchgit; };
in
{ inherit sources; }
