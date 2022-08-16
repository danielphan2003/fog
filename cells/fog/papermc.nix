{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/src/papermc/generated.nix" {};
}
