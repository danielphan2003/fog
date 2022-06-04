{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/src/open-vsx/generated.nix" {};
}
