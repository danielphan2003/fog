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
    preCommand ? "",
    postCommand ? "",
    ...
  } @ args:
    nixpkgs.writeShellScriptBin name ''
      export PATH="$PATH:${l.makeBinPath ["$DEVSHELL_DIR"]}"

      ${preCommand}

      export PATH="$PATH:${l.makeBinPath (["$DEVSHELL_DIR"] ++ packages)}"
      export FOG_CACHE="/tmp/fog"

      mkdir -p "$FOG_CACHE"

      source ${path}

      ${postCommand}
    '';

  getBashFiles = src: let
    toImport = name: type: l.nameValuePair (l.removeSuffix ".bash" name) (src + ("/" + name));
    filterBashFiles = path: type: type == "regular" && l.hasSuffix ".bash" path;
    bashFiles = l.mapAttrs' toImport (l.filterAttrs filterBashFiles (l.readDir src));
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
        cmd = v.writer v;
      in ''
        # ${v.name} subcommand
        "${v.name}")
          shift 1;
          mkcmd "${v.synopsis}" "${v.help}" "${v.description}" ${v.type} "${cmd}/bin/${cmd.name}" "$@"
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
        writer ? writeBashWithPaths,
        type ? "exec",
        ...
      } @ cmd:
        cmd // {inherit packages help synopsis description enable name deps writer type;})
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
        type=$4
        cmd=$5
        shift 5;
        case "$1" in
          "-h"|"help"|"--help")
            printf "%b\n" \
                  "" \
                  "\e[4mUsage\e[0m: $synopsis   $help\n" \
                  "\e[4mDescription\e[0m:\n$description"
            ;;
          *)
            CELL_PATH="$PRJ_ROOT/cells/fog"
            PRJ_ROOT="$PRJ_ROOT" SRC_PATH="$PRJ_ROOT/src" CELL_PATH="$CELL_PATH" PKGS_PATH="$CELL_PATH/pkgs" $type "$cmd" "$@"
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
      gum-fmt = {
        packages = [nixpkgs.gum];
        help = "Helpers to format template strings with gum.";
        path = ./cli/utils/gum-fmt.bash;
        type = "source";
      };
      nvfetcher-cleanup = {
        packages = [nixpkgs.coreutils nixpkgs.fd];
        help = "Clean up nvfetcher on github action.";
        path = ./cli/utils/nvfetcher-cleanup.bash;
        preCommand = ''
          source fog gum-fmt "$(basename $0)"
        '';
      };
      patchSources = {
        packages = [nixpkgs.coreutils nixpkgs.sd];
        help = "Replace source template with up-to-date one.";
        path = ./cli/utils/patch-sources.bash;
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
          nixpkgs.nix
        ];
        help = "Update source.";
        path = ./cli/utils/update-sources.bash;
      };
    }
    // (l.mapAttrs
      (name: path: {
        name = (if name == "open-vsx" then "openvsx" else name) + "-updater";
        packages = [
          nixpkgs.coreutils
          nixpkgs.curl
          nixpkgs.jq
          nixpkgs.ripgrep
          nixpkgs.gnused
          nixpkgs.git
        ];
        help = "Script to update ${name} packages.";
        preCommand = ''
          source fog gum-fmt ${name}
        '';
        inherit path;
      })
      updaters));
}
