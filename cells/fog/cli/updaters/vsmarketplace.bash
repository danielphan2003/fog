pname="VS Code extensions - Visual Studio Marketplace"
package_meta_file="$PKGS_PATH/${1:-"misc/vscode-extensions/vsmarketplace"}.toml"
package_meta_basename="$(basename $package_meta_file)"
count=0

function parseMeta() {
  meta_file="$FOG_CACHE/vsmarketplace.json"
  query_template_file="$CELL_PATH/cli/updaters/vsmarketplace/extension-query.json"
  query_file="$FOG_CACHE/vsmarketplace-extension-query.json"
  nvchecker_file="$FOG_CACHE/vsmarketplace-nvchecker.toml"

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
      count="$(( count + 1 ))"

      namespace_cleaned="$namespace"
      if [[ $namespace =~ ^[[:digit:]] ]]; then
        namespace_cleaned="_$namespace"
      fi
      
      id_cleaned="$namespace_cleaned-$name"
      id="$namespace.$name"

      pushd "$FOG_CACHE"
      # skip non-existent packages
      {
        echo "[$id_cleaned]"
        echo "source = "vsmarketplace"
        echo "vsmarketplace = \"$id\""
      } > "$nvchecker_file"
      nvchecker -c "$nvchecker_file"
      if [ ! "$?" -eq 0 ]; then
        warn "vsmarketplace[$count]" "Cannot find $(bold "$id") on vsmarketplace!"
        continue
      fi
      popd

      # skip added packages
      rg --quiet "$id_cleaned" "$package_meta_file"
      if [ "$?" -eq 0 ]; then
        trace "vsmarketplace[$count]" "$(fg_blue "$id") is already in $package_meta_basename. Skipping..."
        continue
      fi

      trace "vsmarketplace[$count]" "$(fg_blue "$id") is a new extension. Adding to $package_meta_basename..."

      # License is a URL, instead of an identifier
      license="https://marketplace.visualstudio.com/items/$id/license"

      description="${description//'$'/"'$'"}"

      function meta() {
        echo
        echo "[$id_cleaned]"
        echo "src.vsmarketplace = \"$id\""
        echo "fetch.vsmarketplace = \"$id\""
        echo "passthru = { publisher = \"$namespace\", name = \"$name\", description = $description, license = \"$license\" }"
      }

      meta >> "$package_meta_file" \
        && trace "vsmarketplace[$count]" "added $(fg_blue "$id") to $package_meta_basename." \
        || error "vsmarketplace[$count]" "failed to add $(bold "$id"). In: $meta"
    done

    getPage "$pageNumber"
  done
}

parseMeta \
  && trace "vsmarketplace" "generated all vsmarketplace extensions! Processed $count extensions." \
  || error "vsmarketplace" "some errors has been thrown. See logs above."
