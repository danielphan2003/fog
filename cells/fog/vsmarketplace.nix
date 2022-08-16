{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/src/vsmarketplace/generated.nix" {};
}
