export pname="papermc"

bud patchSources "$pname" "$({
  escaped_dollar_sign='$$' # to be changed later in regex, also see: https://github.com/chmln/sd/issues/129

  echo "## $pname"

  meta_file="$BUD_CACHE/papermc-versions.json"

  if [ ! -s "$meta_file" ]; then
    curl -s "https://$pname.io/api/v2/projects/paper" --output "$meta_file"
  fi

  for version in $(jq -r '.versions[]' $meta_file); do
    echo
    echo "[$pname-${version//\./_}]" # replace . with _
    echo "src.cmd = \" bud $pname-updater $version \""
    echo "fetch.url = \"https://papermc.io/api/v2/projects/paper/versions/$version/builds/${escaped_dollar_sign}ver/downloads/paper-$version-${escaped_dollar_sign}ver.jar\""
    echo "passthru = { mcVer = \"$version\" }"
  done

  echo
  echo "## $pname"
})"
