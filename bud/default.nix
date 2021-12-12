{ lib, pkgs, budUtils, ... }:
let
  writeBashWithBudPaths = paths: name: script:
    pkgs.writers.writeBash name ''
      export PATH="${lib.makeBinPath (paths ++ [ "$DEVSHELL_DIR" ])}"
      source ${script}
    '';
  makeUpdaterCmd = args: args // { writer = writeBashWithBudPaths [ pkgs.coreutils pkgs.curl pkgs.jq ]; };
  getBashFiles = folder:
    let
      toImport = name: type: lib.nameValuePair ("${lib.removeSuffix ".bash" name}-updater") (folder + ("/" + name));
      filterPatches = path: type: type == "regular" && lib.hasSuffix ".bash" path;
      bashFiles = lib.mapAttrs' toImport (lib.filterAttrs filterPatches (builtins.readDir folder));
    in
    bashFiles;
  updaters = getBashFiles ./updaters;
in
{
  bud.cmds = with pkgs; {
    nvfetcher-cleanup = {
      writer = budUtils.writeBashWithPaths [ coreutils fd ];
      synopsis = "nvfetcher-cleanup";
      help = "Clean up nvfetcher on github action";
      script = ./utils/nvfetcher-cleanup.bash;
    };
    patchSources = {
      writer = budUtils.writeBashWithPaths [ sd ];
      synopsis = "patchSources";
      help = "Replace source template with up-to-date one.";
      script = ./utils/patch-sources.bash;
    };
  } // (lib.mapAttrs
    (name: path: makeUpdaterCmd {
      synopsis = name;
      help = "Script to update ${lib.removeSuffix "-updater" name}";
      script = path;
    })
    updaters);
}
