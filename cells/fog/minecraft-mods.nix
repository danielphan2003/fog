{
  inputs,
  cell,
}: {
  default = cell.lib.callSource "${inputs.self}/src/minecraft-mods/generated.nix" {};
}
