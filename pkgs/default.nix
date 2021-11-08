final: prev: {
  # run ` nix-instantiate --eval -E $(n eval --raw .\#pkgs.$(uname -m)-linux.latest.${pname}.src) `
  # assuming that we are running on linux
  sources = final.callPackage ./_sources/generated.nix { };
}
