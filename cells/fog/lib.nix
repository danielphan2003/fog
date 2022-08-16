{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
in {
  callSource = path: override:
    import path ({inherit (nixpkgs) fetchgit fetchurl fetchFromGitHub;} // override);
}
