export pname="papermc"

bud patchSources "$pname" "$({
  escaped_dollar_sign='$$' # to be changed later in regex, also see: https://github.com/chmln/sd/issues/129

  echo "## $pname"

  for version in $(curl "https://$pname.io/api/v2/projects/paper" | jq -r '.versions[]'); do
    echo
    echo "[$pname-${version//\./_}]" # replace . with _
    echo "src.cmd = \" curl https://$pname.io/api/v2/projects/paper/versions/$version | jq '.builds | last' \""
    echo "fetch.url = \"https://$pname.io/api/v2/projects/paper/versions/$version/builds/${escaped_dollar_sign}ver/downloads/paper-$version-${escaped_dollar_sign}ver.jar\""
    echo "passthru = { mcVer = \"$version\" }"
  done

  echo
  echo "## $pname"
})"
