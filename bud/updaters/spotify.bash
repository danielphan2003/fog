meta_file="$BUD_CACHE/spotify.json"

if [ ! -s "$meta_file" ]; then
  curl -s -H 'X-Ubuntu-Series: 16' 'https://api.snapcraft.io/api/v1/snaps/details/spotify?channel=candidate' --output "$meta_file"
fi

readarray -t meta <<< "$( jq -r '.package_name,.revision,.snap_id,.version' $meta_file )"
pname="${meta[0]}"
export pname

bud patchSources sources "$pname" "$({
  rev="${meta[1]}"
  snapId="${meta[2]}"
  version="${meta[3]}"

  echo "## $pname"

  echo
  echo "[$pname]" # replace . with _
  echo "src.manual = \"$version\""
  echo "fetch.url = \"https://api.snapcraft.io/api/v1/snaps/download/$snapId"_"$rev.snap\""

  echo
  echo "## $pname"
})"
