pname="papermc"
export pname

function parseMeta() {
  echo "## $pname"

  meta_file="$NIXPKGS_CACHE/papermc-versions.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "https://$pname.io/api/v2/projects/paper" --output "$meta_file"
  fi

  for version in $(jq -r '.versions[]' $meta_file); do
    echo
    echo "[$pname-${version//\./_}]" # replace . with _
    echo "src.cmd = \" nixpkgs $pname-updater $version \""
    echo "fetch.url = \"https://papermc.io/api/v2/projects/paper/versions/$version/builds/\$ver/downloads/paper-$version-\$ver.jar\""
    echo "passthru = { mcVer = \"$version\" }"
  done

  echo
  echo "## $pname"
}

parseMeta > "$PKGS_PATH/${1:-"games/$pname"}.toml"
