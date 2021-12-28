function _bud() {
  placeholder="$(printf "%0.s-" {1..$(( ${#1} + 3 ))})"
  echo "[$1]: running"
  echo "$placeholder with args: ${@: 1}"
  bud "$@"
}

# Create bud cache
_bud makeBudCache

# Clean up old Cargo.lock and extracts
_bud nvfetcher-cleanup _sources/{all-packages,minecraft-mods,papermc,openvsx,vsmarketplace}

# Bump papermc
_bud papermc-versions-updater

# Bump spotify
_bud spotify-updater

# Bump VS Code extensions - OpenVSX
_bud openvsx-updater

# Update Minecraft mods
_bud updateSources misc/minecraft-mods

# Update papermc
_bud updateSources games/papermc

# Update VS Code extensions - OpenVSX
_bud updateSources misc/vscode-extensions/open-vsx

# Update VS Code extensions - Vsmarketplace
_bud updateSources misc/vscode-extensions/vsmarketplace

# Update all packages
_bud updateSources sources all-packages
