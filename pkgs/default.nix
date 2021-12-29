final: prev:
let
  inherit (final) lib;
  callSource = path: override:
    import path ({ inherit (final) fetchgit fetchurl fetchFromGitHub; } // override);
in
{
  sources-minecraft-mods = callSource ./_sources/minecraft-mods/generated.nix { };

  sources-papermc = callSource ./_sources/papermc/generated.nix { };

  sources-vscode-extensions-openvsx = callSource ./_sources/open-vsx/generated.nix { };

  sources-vscode-extensions-vsmarketplace = callSource ./_sources/vsmarketplace/generated.nix { };

  sources-vscode-extensions = lib.mapAttrs
    (ename: eset:
      let
        license = lib.toLower eset.license;
        eset' = builtins.removeAttrs eset [ "description" "license" ];
      in
      eset' // {
        meta = {
          description = eset.description or "";
          license = lib.filterAttrs
            (lname: lset:
              let
                lname' = lib.toLower lname;
                spdxId = lib.toLower (lset.spdxId or "");
              in
              license == lname' || license == spdxId)
            lib.licenses;
        };
      })
    (final.sources-vscode-extensions-vsmarketplace // final.sources-vscode-extensions-openvsx);

  sources' = callSource ./_sources/all-packages/generated.nix { };

  sources = final.sources' // {
    minecraft-mods = final.sources-minecraft-mods;
    papermc = final.sources-papermc;
    vscode-extensions = final.sources-vscode-extensions;
  };
}
