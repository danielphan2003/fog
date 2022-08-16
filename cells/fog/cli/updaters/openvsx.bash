pname="VS Code extensions - OpenVSX"
package_meta_file="$PKGS_PATH/${1:-"misc/vscode-extensions/open-vsx"}.toml"

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
    namespace_cleaned="$namespace"
    if [[ $namespace =~ ^[[:digit:]] ]]; then
      namespace_cleaned="_$namespace"
    fi

    id="$namespace_cleaned-$name"

    # skip added packages
    rg --quiet "$id" "$package_meta_file"
    if [ "$?" -eq 0 ]; then
      continue
    fi

    meta_file="$FOG_CACHE/openvsx-$namespace.$name.json"

    if [ ! -s "$meta_file" ]; then
      curl -s "https://open-vsx.org/api/$namespace/$name" --output "$meta_file"
    fi

    license="$(jq -r '.license // "" | tojson' "$meta_file")"

    description="${description//'$'/"'$'"}"

    echo
    echo "[$id]"
    echo "src.openvsx = \"$namespace.$name\""
    echo "fetch.openvsx = \"$namespace.$name\""
    echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = $license }"
  done
}

parseMeta >> "$package_meta_file"
