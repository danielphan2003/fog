dir="${1:-"all-packages"}"

cd "$SRC_PATH" || exit

mkdir -p "$dir"

# remove generated files in $dir
fd . "$dir" \
  --type directory \
  --exclude *.nix \
  --exclude *.json \
  --exec-batch rm -rf {} \
  && traceMsg "removed all generated files in $dir, except *.nix and *.json" \
  || warnMsg "failed to remove generated files in $dir!"
