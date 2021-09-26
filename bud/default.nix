{ pkgs, lib, budUtils, ... }:
let
  writeBashWithNixPaths = paths: name: script:
    pkgs.writers.writeBash name ''
      export PATH="${lib.makeBinPath paths}"
      export NIX_PATH="$NIX_PATH:nixpkgs=${toString pkgs.path}"
      source ${script}
    '';
in
{
  bud.cmds = with pkgs; {
    nvfetcher-cleanup = {
      writer = writeBashWithNixPaths [ coreutils fd dasel curl jq gnused ];
      synopsis = "nvfetcher-cleanup";
      help = "Clean up nvfetcher on github action";
      script = ./nvfetcher-cleanup.bash;
    };
  };
}
