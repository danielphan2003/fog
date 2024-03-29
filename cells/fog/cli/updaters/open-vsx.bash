pname="open-vsx"
desc="VS Code extensions - OpenVSX"
package_meta_file="${1:-"$PKGS_PATH/misc/vscode-extensions/$pname"}.toml"
package_meta_basename="$(basename $package_meta_file)"
package_meta_dirname="$(dirname $package_meta_file)"
count=0

function parseMeta() {
  function reqUrl() {
    echo "https://open-vsx.org/api/-/search?includeAllVersions=false&offset=0&size=${1:-1}&sortOrder=asc"
  }

  totalSize=$( curl -s "$(reqUrl)" | jq -r '.totalSize' )

  meta_file="$FOG_CACHE/$pname.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "$(reqUrl $totalSize)" --output "$meta_file"
  fi

  mkdir -p "$package_meta_dirname"
  touch "$package_meta_file"

  jq -M -r '
    .extensions[] | .namespace, .name, .version, .files.download, (.description // "" | tojson)
  ' "$meta_file" | \
  while read -r namespace; read -r name; read -r version; read -r downloadUrl; read -r description; do
    count="$(( count + 1 ))"

    namespace_cleaned="$namespace"
    if [[ $namespace =~ ^[[:digit:]] ]]; then
      namespace_cleaned="_$namespace"
    fi

    id_cleaned="$namespace_cleaned-$name"
    id="$namespace.$name"

    # patch added packages
    rg --quiet "$id_cleaned" "$package_meta_file"
    if [ "$?" -eq 0 ]; then
      trace "$pname[$count]" "$(fg_blue "$id") is already in $package_meta_basename. Patching version instead..."
      sed -i \
        -e 's,src.manual = ".*" # '$id',src.manual = "'$version'" # '$id',g' \
        -e 's,fetch.url = ".*" # '$id',fetch.url = "'$downloadUrl'" # '$id',g' \
        "$package_meta_file"
      continue
    fi

    trace "$pname[$count]" "$(fg_blue "$id") is a new extension. Adding to $package_meta_basename..."

    meta_file="$FOG_CACHE/openvsx-$id_cleaned.json"

    if [ ! -s "$meta_file" ]; then
      curl -s "https://open-vsx.org/api/$namespace/$name" --output "$meta_file"
    fi

    license="$(jq -r '.license // "" | tojson' "$meta_file")"

    description="${description//'$'/"'$'"}"

    function meta() {
      echo
      echo "[$id_cleaned]"
      echo "src.manual = \"$version\" # $id"
      echo "fetch.url = \"$downloadUrl\" # $id"
      echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = $license }"
    }

    meta >> "$package_meta_file" \
      && trace "$pname[$count]" "added $(fg_blue "$id") to $package_meta_basename." \
      || error "$pname[$count]" "failed to add $(bold "$id"). In: $meta"
  done

  echo >> "$package_meta_file"
}

parseMeta \
  && traceMsg "generated $count extensions." \
  || errorMsg "some errors has been thrown. See logs above."

git add "$package_meta_file"
