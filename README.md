# fog

Where else would a [*flake*][flake] forms ;)

## Package sets

Including:
- [all-packages]: @all-packages@ packages. *Updated hourly.*
- [minecraft-mods]: @minecraft-mods@ packages. *Updated hourly.*
- [papermc][papermc-toml]: Autogenerated from [all versions][papermc-all] (1.8 - 1.19) of [papermc]. *Updated hourly.*
- [vscode-extensions][vscode-extensions-nix]: A collection of (almost) all extensions for [Visual Studio Code][vscode].
  - [open-vsx][open-vsx-toml]: @open-vsx@ packages. *Updated every 2 hours.*
  - [vsmarketplace][vsmarketplace-toml]: @vsmarketplace@ packages. *Updated every 3 hours.*

[all-packages]: ./cells/fog/pkgs/all-packages.toml
[flake]: https://github.com/danielphan2003/flk
[minecraft-mods]: ./cells/fog/pkgs/misc/minecraft-mods.toml
[open-vsx-toml]: ./cells/fog/pkgs/misc/vscode-extensions/open-vsx.toml
[papermc-all]: https://papermc.io/api/v2/projects/paper
[papermc-toml]: ./cells/fog/pkgs/games/papermc.toml
[papermc]: https://papermc.io
[vscode]: https://code.visualstudio.com
[vscode-extensions-nix]: ./cells/fog/vscode-extensions.nix
[vsmarketplace-toml]: ./cells/fog/pkgs/misc/vscode-extensions/vsmarketplace.toml
