final: prev: {
  # a hacky way so that we can run ` nix eval --raw '.#sources.${pname}.src' `
  sources = final.emptyFile.overrideAttrs (_: {
    passthru = final.callPackage ./_sources/generated.nix { };
  });

  # this doesn't work
  # sources = (final.callPackage ./_sources/generated.nix { }) // {
  #   __dontExport = false;
  # };
}
