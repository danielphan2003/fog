cd "$PRJ_ROOT"/pkgs || exit

# remove old Cargo.lock
fd . _sources \
  --type directory \
  --exclude generated.nix \
  --exclude '.shake.*' \
  --exec-batch rm -rf {}
