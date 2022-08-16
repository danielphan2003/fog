{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/src/all-packages/generated.nix" {};
}
