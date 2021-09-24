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
    nvfetcher-github = {
      writer = writeBashWithNixPaths [ nvfetcher-bin coreutils git nixUnstable fd dasel curl jq gnused ];
      synopsis = "nvfetcher-github";
      help = "Auto update with nvfetcher on github action";
      script = ./nvfetcher-github.bash;
    };
  };
}
