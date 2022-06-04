{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;

  cmdWithCategory = category: attrs: attrs // {inherit category;};

  pkgWithCategory = category: package: cmdWithCategory category {inherit package;};

  withCategory = category: attrs:
    let
      mapWith =
        if l.isDerivation attrs
        then pkgWithCategory
        else cmdWithCategory;
    in mapWith category attrs;

  mkCategories = categories: attrs:
    let
      withCategories = l.genAttrs categories (category: withCategory category);
    in withCategories // attrs;

  categories = [
    "cli-dev"
    "devos"
    "docs"
    "formatters"
    "legal"
    "utils"
  ];
in {
  callSource = path: override:
    let
      paths = l.mapAttrs
        (_: path':
          let
            fullPath = "${path}/${path'}";
            exists = l.pathExists fullPath;
            hasSuffix = l.hasSuffix path' path;
          in {inherit fullPath exists hasSuffix;})
        {
          generated = "generated.nix";
          default = "default.nix";
        };

      path' = with paths;
        if generated.exists || default.exists
        then
          if generated.exists && !generated.hasSuffix
          then generated.fullPath
          else
            if default.exists && !default.hasSuffix
            then default.fullPath
            else path
        else path;
    in import path' ({ inherit (nixpkgs) fetchgit fetchurl fetchFromGitHub; } // override);

  categories = mkCategories categories {
    inherit cmdWithCategory pkgWithCategory withCategory categories;
  };
}
