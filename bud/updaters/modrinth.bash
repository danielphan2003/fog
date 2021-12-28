modId="$1"
mcVer="$2"
operation="$3"

filter=""
case $operation in

  -f|--files)
    filter='.files[] | .filename'
    ;;

  -e|--version-number|*)
    filter='.version_number'
    ;;

esac

meta_file="$BUD_CACHE/$modId.json"

if [ ! -s "$meta_file" ]; then
  curl -s "https://api.modrinth.com/api/v1/mod/$modId/version" --output "$meta_file"
fi

jq -r \
  "map( select( any( .game_versions[]; . == \"$mcVer\" ) ) | $filter) | first" \
  "$meta_file"
