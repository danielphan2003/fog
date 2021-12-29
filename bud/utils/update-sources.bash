file="$1"
sourceDir="_sources/${2:-"$(basename $file)"}"
file="$file.toml"

args=( "${@: 3}" )
if [ $CI ]; then
  args+=( --commit-changes )
fi

cd "$PRJ_ROOT"/pkgs || exit

nvfetcher \
  -o "$sourceDir" \
  "${args[@]}" \
  -c "$file"
