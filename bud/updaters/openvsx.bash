pname="VS Code extensions - OpenVSX"
export pname

function parseMeta() {
  function reqUrl() {
    echo "https://open-vsx.org/api/-/search?includeAllVersions=false&offset=0&size=${1:-1}&sortOrder=asc"
  }

  totalSize=$( curl -s "$(reqUrl)" | jq -r '.totalSize' )

  meta_file="$BUD_CACHE/openvsx.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "$(reqUrl $totalSize)" --output "$meta_file"
  fi

  echo "## $pname"

  jq -M -r '
    .extensions[] | .namespace, .name, (.version | tojson), (.files.download | tojson), (.description // "" | tojson)
  ' "$meta_file" | \
  while read -r namespace; read -r name; read -r version; read -r downloadUrl; read -r description; do
    meta_file="$BUD_CACHE/openvsx-$namespace.$name.json"

    if [ "$namespace.$name" = "matklad.rust-analyzer" ]; then
      continue
    fi

    if [ ! -s "$meta_file" ]; then
      curl -s "https://open-vsx.org/api/$namespace/$name" --output "$meta_file"
    fi

    license="$(jq -r '.license // "" | tojson' "$meta_file")"

    namespace_cleaned="$namespace"
    if [[ $namespace =~ ^[[:digit:]] ]]; then
      namespace_cleaned="_$namespace"
    fi

    description="${description//'$'/"'$'"}"

    echo
    echo "[$namespace_cleaned-$name]"
    echo "src.manual = $version"
    echo "fetch.url = $downloadUrl"
    echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = $license }"
  done

  echo
  echo "## $pname"
}

parseMeta > "$PRJ_ROOT/pkgs/${1:-"misc/vscode-extensions/open-vsx"}.toml"
