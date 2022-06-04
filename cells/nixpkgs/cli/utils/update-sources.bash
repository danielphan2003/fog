file="$1"
sourceDir="${2:-"$(basename $file)"}"
file="$PKGS_PATH/cells/nixpkgs/pkgs/$file.toml"

args=( "${@: 3}" )
if [ $CI ]; then
  args+=( --commit-changes )
fi

echo "${args[@]}"

cd "$SRC_PATH" || exit

nvfetcher \
  -o "$sourceDir" \
  "${args[@]}" \
  -c "$file"
