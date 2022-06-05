file="$1"
name="$file"
sourceDir="${2:-"$(basename $file)"}"
file="$PKGS_PATH/$file.toml"

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

if [ $CI ]; then
  git add .
  git commit -m "Update: $name"
fi
