{ pkgs, budUtils, ... }: {
  bud.cmds = with pkgs; {
    nvfetcher-cleanup = {
      writer = budUtils.writeBashWithPaths [ coreutils fd dasel curl gnused ];
      synopsis = "nvfetcher-cleanup";
      help = "Clean up nvfetcher on github action";
      script = ./nvfetcher-cleanup.bash;
    };
  };
}
