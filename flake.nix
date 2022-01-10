{
  description = "A highly structured configuration database.";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
    extra-substituters = "https://cache.nixos.org https://nrdxp.cachix.org https://nix-community.cachix.org https://dan-cfg.cachix.org";
    extra-trusted-public-keys = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= dan-cfg.cachix.org-1:elcVKJWjnDs1zzZ/Fs93FLOFS13OQx1z0TxP0Q7PH9o=";
  };

  inputs = {
    nixos.url = "github:nixos/nixpkgs/release-21.11";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";

    digga = {
      url = "github:divnix/digga/cleanup-dar";
      inputs = {
        nixpkgs.follows = "nixos";
        latest.follows = "nixos";
        nixlib.follows = "nixos";
      };
    };

    bud = {
      url = "github:divnix/bud";
      inputs = {
        nixpkgs.follows = "nixos";
        devshell.follows = "digga/devshell";
      };
    };

    nvfetcher = {
      url = "github:berberman/nvfetcher/core";
      inputs = {
        nixpkgs.follows = "nixos";
        flake-compat.follows = "digga/deploy/flake-compat";
        flake-utils.follows = "digga/flake-utils-plus/flake-utils";
      };
    };
  };

  outputs =
    { self
    , latest
    , digga
    , bud
    , nixos
    , nvfetcher
    , ...
    } @ inputs:
    digga.lib.mkFlake
      {
        inherit self inputs;

        channels = {
          nixos = {
            overlays = [
              nvfetcher.overlay
              ./pkgs/default.nix
            ];
          };
          latest = { };
        };

        nixos.hostDefaults.channelName = "nixos";

        devshell = ./shell;
      }
    //
    {
      budModules = { devos = import ./bud; };
    }
  ;
}
