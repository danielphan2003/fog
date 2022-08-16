version="$1"

meta_file="$FOG_CACHE/papermc-$version.json"

if [ ! -s "$meta_file" ]; then
  curl -s "https://papermc.io/api/v2/projects/paper/versions/$version" --output "$meta_file"
fi

jq -r '.builds | last' "$meta_file"
