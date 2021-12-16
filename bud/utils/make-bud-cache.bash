export BUD_CACHE=/tmp/bud

mkdir -p $BUD_CACHE

for file_name in "$BUD_CACHE"/*; do
  current_time=$(date +%s)
  file_time=$(date -r "$file_name" +%s)
  durations=$(( current_time - file_time ))

  # remove files if it existed for more than 1 hour
  if [ $(( durations / 60 / 60 )) -gt 1 ]; then
    rm "$file_name"
  fi
done
