{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs nvfetcher;

  writeBashWithPaths = {
    packages ? [],
    path,
    name,
    ...
  } @ args:
    nixpkgs.writeShellScript name ''
      export PATH="$PATH:${l.makeBinPath (packages ++ ["$DEVSHELL_DIR"])}"
      source ${path}
    '';

  writeBashWithFogPaths = {
    packages ? [],
    path,
    name,
    ...
  } @ args:
    nixpkgs.writeShellScript name ''
      export PATH="$PATH:${l.makeBinPath (packages ++ ["$DEVSHELL_DIR"])}"
      ${name} makeFogCache
      export FOG_CACHE=''${FOG_CACHE:-/tmp/${name}}
      mkdir -p $FOG_CACHE
      source ${path}
    '';

  getBashFiles = folder: let
    toImport = name: type: l.nameValuePair "${l.removeSuffix ".bash" name}-updater" (folder + ("/" + name));
    filterPatches = path: type: type == "regular" && l.hasSuffix ".bash" path;
    bashFiles = l.mapAttrs' toImport (l.filterAttrs filterPatches (l.readDir folder));
  in
    bashFiles;

  updaters = getBashFiles ./cli/updaters;

  addUsage = l.mapAttrs (k: v:
    l.removeAttrs v ["path" "enable" "synopsis" "help" "description"]
    // {
      text = ''
        "${v.synopsis}" "${v.help}" \'';
    });

  addCase = l.mapAttrs (k: v:
    l.removeAttrs v ["path" "enable" "synopsis" "help" "description"]
    // {
      text = let
        default = v.writer v;
      in ''
        # ${k} subcommand
        "${k}")
          shift 1;
          mkcmd "${v.synopsis}" "${v.help}" "${v.description}" "${default}" "$@"
          ;;
      '';
    });

  mkCli = name: cmds: let
    cmds' = l.mapAttrs (name': {
        packages ? [],
        help ? "",
        synopsis ? name,
        description ? "",
        enable ? true,
        name ? name',
        deps ? [],
        ...
      } @ cmd:
        cmd // {inherit packages help synopsis description enable name deps;})
    cmds;
  in
    nixpkgs.writeShellScriptBin name ''
      export PATH="${l.makeBinPath [nixpkgs.coreutils]}"

      shopt -s extglob

      # needs a PRJ_ROOT
      [[ -d "$PRJ_ROOT" ]] ||
        {
          echo "This script must be run either from the flake's devshell or its root path must be specified" >&2
          exit 1
        }

      # PRJ_ROOT must be writable (no store path)
      [[ -w "$PRJ_ROOT" ]] ||
        {
          echo "You canot use the flake's store path for reference."
              "This script requires a pointer to the writable flake root." >&2
          exit 1
        }

      mkcmd () {
        synopsis=$1
        help=$2
        description=$3
        default=$4
        shift 4;
        case "$1" in
          "-h"|"help"|"--help")
            printf "%b\n" \
                  "" \
                  "\e[4mUsage\e[0m: $synopsis   $help\n" \
                  "\e[4mDescription\e[0m:\n$description"
            ;;
          *)
            PRJ_ROOT="$PRJ_ROOT" FOG_CACHE="$FOG_CACHE" SRC_PATH="$PRJ_ROOT/src" CELL_PATH="$PRJ_ROOT/cells/fog" PKGS_PATH="$CELL_PATH/pkgs" exec $default "$@"
            ;;
        esac
      }

      usage () {
      printf "%b\n" \
        "" \
        "\e[4mUsage\e[0m: $(basename $0) COMMAND [ARGS]\n" \
        "\e[4mCommands\e[0m:"
      printf "  %-30s %s\n\n" \
      ${l.textClosureMap l.id (addUsage cmds') (l.attrNames cmds')}

      }

      case "$1" in
      ""|"-h"|"help"|"--help")
        usage
        ;;

      ${l.textClosureMap l.id (addCase cmds') (l.attrNames cmds')}
      esac
    '';
in {
  default = mkCli "fog" ({
      makeFogCache = {
        packages = [nixpkgs.coreutils];
        help = "Create fog cache directory to avoid excessive API requests";
        path = ./cli/utils/make-fog-cache.bash;
        writer = writeBashWithPaths;
      };
      nvfetcher-cleanup = {
        packages = [nixpkgs.coreutils nixpkgs.fd];
        help = "Clean up nvfetcher on github action";
        path = ./cli/utils/nvfetcher-cleanup.bash;
        writer = writeBashWithPaths;
      };
      patchSources = {
        packages = [nixpkgs.coreutils nixpkgs.sd];
        help = "Replace source template with up-to-date one.";
        path = ./cli/utils/patch-sources.bash;
        writer = writeBashWithPaths;
      };
      updateSources = {
        packages = [
          nixpkgs.coreutils
          nixpkgs.nvfetcher
          nixpkgs.git
          nixpkgs.nix-prefetch
          nixpkgs.gnutar
          nixpkgs.xz
          nixpkgs.git
          nixpkgs.bash
          nixpkgs.gnupg
          nixpkgs.nix
        ];
        help = "Update source";
        path = ./cli/utils/update-sources.bash;
        writer = writeBashWithFogPaths;
      };
    }
    // (l.mapAttrs
      (name: path: {
        inherit name path;
        writer = writeBashWithFogPaths;
        help = "Script to update ${l.removeSuffix "-updater" name}";
        packages = [nixpkgs.coreutils nixpkgs.curl nixpkgs.jq];
      })
      updaters));
}
