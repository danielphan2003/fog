pname="VS Code extensions - Visual Studio Marketplace"
package_meta_file="$PKGS_PATH/${1:-"misc/vscode-extensions/vsmarketplace"}.toml"

function parseMeta() {
  meta_file="$FOG_CACHE/vsmarketplace.json"
  query_template_file="$CELL_PATH/cli/updaters/vsmarketplace/extension-query.json"
  query_file="$FOG_CACHE/vsmarketplace-extension-query.json"

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

  for pageNumber in $(seq 1 $pageNumbers); do
    jq -M -r '
      .results[0].extensions[] | .publisher.publisherName, .extensionName, (.versions[0].version | tojson), (.versions[0].files[0].source | tojson), (.shortDescription // "" | tojson)
    ' "$meta_file" | \
    while read -r namespace; read -r name; read -r version; read -r downloadUrl; read -r description; do
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

      # License is a URL, instead of an identifier
      license="https://marketplace.visualstudio.com/items/$namespace.$name/license"

      description="${description//'$'/"'$'"}"

      echo
      echo "[$id]"
      echo "src.vsmarketplace = \"$namespace.$name\""
      echo "fetch.vsmarketplace = \"$namespace.$name\""
      echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = \"$license\" }"
    done

    getPage "$pageNumber"
  done
}

parseMeta >> "$package_meta_file"
