{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  nixpkgs = inputs.nixpkgs;
in {
  default = {config, ...}: let
    cfg = config.fog;
  in {
    config = {
      commands = [{package = cell.cli.default;}];
    };
  };
}
