pname="papermc"
package_meta_file="$PKGS_PATH/${1:-"games/$pname"}.toml"
export pname

function parseMeta() {
  echo "## $pname" > "$package_meta_file"

  meta_file="$FOG_CACHE/papermc-versions.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "https://$pname.io/api/v2/projects/paper" --output "$meta_file"
  fi

  for version in $(jq -r '.versions[]' $meta_file); do
    if [[ "$(fog papermc-updater $version)" -eq "null" ]]; then
      traceMsg "papermc $(fg_blue $version) is null when using `fog papermc-updater`"
      continue
    fi

    traceMsg "updating papermc $(fg_blue $version)..."

    function meta() {
      echo
      echo "[$pname-${version//\./_}]" # replace . with _
      echo "src.cmd = \" fog $pname-updater $version \""
      echo "fetch.url = \"https://papermc.io/api/v2/projects/paper/versions/$version/builds/\$ver/downloads/paper-$version-\$ver.jar\""
      echo "passthru = { mcVer = \"$version\" }"
    }

    meta >> "$package_meta_file" \
      && traceMsg "updated papermc $(fg_blue $version)." \
      || errorMsg "failed to update papermc $(fg_blue $version)."
  done

  {
    echo
    echo "## $pname"
  } >> "$package_meta_file"
}

parseMeta \
  && traceMsg "generated all papermc versions!" \
  || errorMsg "some errors has been thrown. See logs above."

git add "$package_meta_file"
