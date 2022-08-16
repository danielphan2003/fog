dir="${1:-"all-packages"}"

cd "$SRC_PATH" || exit

# remove old Cargo.lock
fd . "$dir" \
  --type directory \
  --exclude *.nix \
  --exclude *.json \
  --exec-batch rm -rf {}
