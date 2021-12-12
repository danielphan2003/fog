rawMeta="$( curl -H 'X-Ubuntu-Series: 16' 'https://api.snapcraft.io/api/v1/snaps/details/spotify?channel=candidate' )"
readarray -t meta <<< "$( echo "$rawMeta" | jq -r '.package_name,.revision,.snap_id,.version' )"
export pname="${meta[0]}"

bud patchSources "$pname" "$({
  rev="${meta[1]}"
  snapId="${meta[2]}"
  version="${meta[3]}"

  echo "## $pname"

  echo
  echo "[$pname]" # replace . with _
  echo "src.cmd = \" echo $version \""
  echo "fetch.url = \"https://api.snapcraft.io/api/v1/snaps/download/$snapId"_"$rev.snap\""

  echo
  echo "## $pname"
})"
