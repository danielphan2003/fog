cd $FLAKEROOT/pkgs

# remove old Cargo.lock
fd . _sources \
  -t d \
  -E generated.nix \
  -E '.shake.*' \
  -X rm -rf {}

nvfetcher -c ./sources.toml -l changelog --no-output

if [ ! -z "$(cat changelog)" ]; then
  echo "COMMIT_MSG<<EOF" >>$GITHUB_ENV
  echo "pkgs: auto update on $(date +"%Y/%m/%d @ %H:%M:%S")" >>$GITHUB_ENV
  echo "$(cat changelog)" >>$GITHUB_ENV
  echo "EOF" >>$GITHUB_ENV
  rm -rf changelog
else
  rm -rf changelog
fi
