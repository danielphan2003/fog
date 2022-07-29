{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  default =
    l.mapAttrs
    (ename: eset: let
      license = l.toLower eset.license;
      eset' = l.removeAttrs eset ["description" "license"];
    in
      eset'
      // {
        meta = {
          description = eset.description or "";
          license =
            l.filterAttrs
            (lname: lset: let
              lname' = l.toLower lname;
              spdxId = l.toLower (lset.spdxId or "");
            in
              license == lname' || license == spdxId)
            l.licenses;
        };
      })
    (cell.vsmarketplace.default // cell.open-vsx.default);
}
