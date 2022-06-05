file="$1"
sourceDir="${2:-"$(basename $file)"}"
file="$PKGS_PATH/$file.toml"

args=( "${@: 3}" )

echo "${args[@]}"

cd "$SRC_PATH" || exit

nvfetcher \
  -o "$sourceDir" \
  "${args[@]}" \
  -c "$file"
