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

git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --global user.name github-actions

nvfetcher \
  --verbose \
  --retry 5 \
  --build-dir "$sourceDir" \
  "${args[@]}" \
  --config "$file"
