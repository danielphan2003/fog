pname="VS Code extensions - OpenVSX"
package_meta_file="$PKGS_PATH/${1:-"misc/vscode-extensions/open-vsx"}.toml"
count=0

function parseMeta() {
  function reqUrl() {
    echo "https://open-vsx.org/api/-/search?includeAllVersions=false&offset=0&size=${1:-1}&sortOrder=asc"
  }

  totalSize=$( curl -s "$(reqUrl)" | jq -r '.totalSize' )

  meta_file="$FOG_CACHE/openvsx.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "$(reqUrl $totalSize)" --output "$meta_file"
  fi

  jq -M -r '
    .extensions[] | .namespace, .name, (.description // "" | tojson)
  ' "$meta_file" | \
  while read -r namespace; read -r name; read -r description; do
    count="$(( count + 1 ))"

    namespace_cleaned="$namespace"
    if [[ $namespace =~ ^[[:digit:]] ]]; then
      namespace_cleaned="_$namespace"
    fi

    id_cleaned="$namespace_cleaned-$name"
    id="$namespace.$name"

    # skip added packages
    rg --quiet "$id_cleaned" "$package_meta_file"
    if [ "$?" -eq 0 ]; then
      trace "open-vsx[$count]" "$id is already in $package_meta_basename. Skipping..."
      continue
    fi

    trace "open-vsx[$count]" "$(fg_blue "$id") is a new extension. Adding to $package_meta_basename..."

    meta_file="$FOG_CACHE/openvsx-$namespace.$name.json"

    if [ ! -s "$meta_file" ]; then
      curl -s "https://open-vsx.org/api/$namespace/$name" --output "$meta_file"
    fi

    license="$(jq -r '.license // "" | tojson' "$meta_file")"

    description="${description//'$'/"'$'"}"

    function meta() {
      echo
      echo "[$id_cleaned]"
      echo "src.openvsx = \"$namespace.$name\""
      echo "fetch.openvsx = \"$namespace.$name\""
      echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = $license }"
    }

    meta >> "$package_meta_file" \
      && trace "open-vsx[$count]" "added $(fg_blue "$id") to $package_meta_basename." \
      || error "open-vsx[$count]" "failed to add $(bold "$id"). In: $meta"
  done
}

parseMeta \
  && trace "open-vsx" "generated all open-vsx extensions! Processed $count extensions." \
  || error "open-vsx" "some errors has been thrown. See logs above."
