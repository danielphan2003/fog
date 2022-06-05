{
  description = "An opinionated way of updating nixpkgs source.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    { self
    , std
    , ...
    } @ inputs:
    std.grow {
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

        (std.devshells "devshells")
      ];
    }
  ;

  # --- Flake Local Nix Configuration ----------------------------
  # TODO: adopt spongix
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nrdxp.cachix.org"
      "https://nix-community.cachix.org"
      "https://dan-cfg.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "dan-cfg.cachix.org-1:elcVKJWjnDs1zzZ/Fs93FLOFS13OQx1z0TxP0Q7PH9o="
    ];
  };
  # --------------------------------------------------------------
}
