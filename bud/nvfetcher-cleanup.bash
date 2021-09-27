cd "$FLAKEROOT"/pkgs || exit

# remove old Cargo.lock
fd . _sources \
  -t d \
  -E generated.nix \
  -E '.shake.*' \
  -X rm -rf {}

SPOTIFY_INFO="$(curl -H 'X-Ubuntu-Series: 16' 'https://api.snapcraft.io/api/v1/snaps/details/spotify?channel=candidate' | tr '\\\n' ' ')"
SPOTIFY_SRC_MANUAL="$(echo "$SPOTIFY_INFO" | dasel -p json --plain '.version')"
SPOTIFY_FETCH_URL="$(echo "$SPOTIFY_INFO" | dasel -p json --plain '.download_url')"

OLD_SPOTIFY_SRC_MANUAL="$(dasel -f ./sources.toml -p toml '.spotify.src.manual')"
OLD_SPOTIFY_FETCH_URL="$(dasel -f ./sources.toml -p toml '.spotify.fetch.url')"

sed -i \
  -e "s#$OLD_SPOTIFY_SRC_MANUAL#$SPOTIFY_SRC_MANUAL#g" \
  -e "s#$OLD_SPOTIFY_FETCH_URL#$SPOTIFY_FETCH_URL#g" \
  ./sources.toml
