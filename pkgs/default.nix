{ inputs }:

final: prev:
let
  inherit (prev.lib) mapAttrs removePrefix;
  sources' = import ./_sources/generated.nix { inherit (final) fetchurl fetchgit; };
  sources =
    mapAttrs
      (pname: meta: meta // { version = removePrefix "v" meta.version; })
      sources';
in
{ inherit sources; }
