dir="${1:-"_sources"}"

cd "$PRJ_ROOT"/pkgs || exit

# remove old Cargo.lock
fd . "$dir" \
  --type directory \
  --exclude generated.nix \
  --exclude '.shake.*' \
  --exec-batch rm -rf {}
