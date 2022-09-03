pname="vsmarketplace"
desc="VS Code extensions - Visual Studio Marketplace"
package_meta_file="$PKGS_PATH/misc/vscode-extensions/$pname.toml"
package_meta_basename="$(basename $package_meta_file)"
package_meta_dirname="$(dirname $package_meta_file)"
count=0
batch_count=0
max_count="${1:-1000}"

function parseMeta() {
  meta_file="$FOG_CACHE/$pname.json"
  query_template_file="$CELL_PATH/cli/updaters/$pname/extension-query.json"
  query_file="$FOG_CACHE/$pname-extension-query.json"
  nvchecker_file="$FOG_CACHE/$pname-nvchecker.toml"

  function reqUrl() {
    echo "https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery"
  }

  function getPage() {
    jq \
      -r '.filters |= (.[0].pageNumber = $pageNumber)' \
      --argjson pageNumber "${1:-1}" \
      "$query_template_file" > "$query_file"

    curl \
      --silent \
      --show-error \
      --request POST \
      --header "Accept: application/json;api-version=3.0-preview.1" \
      --header "Content-Type: application/json" \
      --data-binary '@'"$query_file" \
      --output "$meta_file" \
      "$(reqUrl)"
  }

  getPage 1

  totalSize="$( jq -r '.results[0] | .resultMetadata[0] | .metadataItems[0] | .count' "$meta_file" )"

  pageNumbers="$(( totalSize / 1000 ))"

  if [ "$(( totalSize % 1000 ))" -gt 0 ]; then
    totalSize="$(( totalSize + 1 ))"
  fi

  mkdir -p "$package_meta_dirname"
  touch "$package_meta_file"

  for pageNumber in $(seq 1 $pageNumbers); do
    jq -M -r '
      .results[0].extensions[] | .publisher.publisherName, .extensionName, .versions[0].version, .versions[0].files[0].source, (.shortDescription // "" | tojson)
    ' "$meta_file" | \
    while read -r namespace; read -r name; read -r version; read -r downloadUrl; read -r description; do
      echo "[count]: $count"
      echo "[batch_count]: $batch_count"
      echo "[max_count]: $max_count"
      echo "[curr_count]: $(( 1000 * batch_count + count ))"

      if [ "$(( 1000 * batch_count + count ))" -ge "$max_count" ]; then
        continue
      fi

      count="$(( count + 1 ))"
      
      if [ "$count" -eq 1000 ]; then
        batch_count="$(( batch_count + 1 ))"
      fi

      namespace_cleaned="$namespace"
      if [[ $namespace =~ ^[[:digit:]] ]]; then
        namespace_cleaned="_$namespace"
      fi
      
      id_cleaned="$namespace_cleaned-$name"
      id="$namespace.$name"

      if [ "$downloadUrl" = "" ] || [ "$downloadUrl" = "null" ]; then
        warn "$pname[$count]" "Cannot find $(bold "$id") on $pname!"
        continue
      fi

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

      # License is a URL, instead of an identifier
      license="https://marketplace.visualstudio.com/items/$id/license"

      description="${description//'$'/"'$'"}"

      function meta() {
        echo
        echo "[$id_cleaned]"
        echo "src.manual = \"$version\" # $id"
        echo "fetch.url = \"$downloadUrl\" # $id"
        echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = \"$license\" }"
      }

      meta >> "$package_meta_file" \
        && trace "$pname[$count]" "added $(fg_blue "$id") to $package_meta_basename." \
        || error "$pname[$count]" "failed to add $(bold "$id"). In: $meta"
    done

    getPage "$pageNumber"
  done

  echo >> "$package_meta_file"
}

parseMeta \
  && traceMsg "generated $count extensions." \
  || errorMsg "some errors has been thrown. See logs above."

git add "$package_meta_file"
