{
  description = "An opinionated way of updating nixpkgs source.";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
    extra-substituters = "https://cache.nixos.org https://nrdxp.cachix.org https://nix-community.cachix.org https://dan-cfg.cachix.org";
    extra-trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= dan-cfg.cachix.org-1:elcVKJWjnDs1zzZ/Fs93FLOFS13OQx1z0TxP0Q7PH9o=";
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    inputs.std.grow {
      inherit inputs;
      cellsFrom = ./cells;
      organelles = [
        (inputs.std.runnables "cli")
        (inputs.std.runnables "repl")

        (inputs.std.functions "lib")
        (inputs.std.functions "categories")

        (inputs.std.functions "all-packages")
        (inputs.std.functions "minecraft-mods")
        (inputs.std.functions "papermc")
        (inputs.std.functions "openvsx")
        (inputs.std.functions "vsmarketplace")
        (inputs.std.functions "vscode-extensions")

        (inputs.std.devshells "devshells")
      ];
    }
  ;
}
