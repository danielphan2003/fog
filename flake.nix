{
  description = "An opinionated way of updating nixpkgs source.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./cells;
      organelles = [
        (std.runnables "cli")
        (std.runnables "repl")

        (std.functions "lib")
        (std.functions "categories")

        (std.functions "all-packages")
        (std.functions "minecraft-mods")
        (std.functions "papermc")
        (std.functions "open-vsx")
        (std.functions "vsmarketplace")
        (std.functions "vscode-extensions")

        (std.functions "devshellProfiles")
        (std.devshells "devshells")
      ];
    } {
      devShells = std.harvest self ["automation" "devshells"];
    };

  # --- Flake Local Nix Configuration ----------------------------
  # TODO: adopt spongix
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://fog.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fog.cachix.org-1:FAxiA6qMLoXEUdEq+HaT24g1MjnxdfygrbrLDBp6U/s="
    ];
  };
  # --------------------------------------------------------------
}
