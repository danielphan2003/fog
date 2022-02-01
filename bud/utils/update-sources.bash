file="$1.toml"
sourceDir="_sources/${2:-"$(basename $file)"}"

args=( "${@: 3}" )
if [ $CI ]; then
  args+=( --commit-changes )
fi

echo "${args[@]}"

cd "$PRJ_ROOT"/pkgs || exit

nvfetcher \
  -o "$sourceDir" \
  "${args[@]}" \
  -c "$file"
