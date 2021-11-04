channels: final: prev: {

  __dontExport = true; # overrides clutter up actual creations

  inherit (channels.latest)
    cachix
    nixpkgs-fmt
    nvchecker
    ;

}
