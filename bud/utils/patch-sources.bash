# package name
pname="$1"

# content to replace with
patchContent="$2"

# set boundary for patching
bound='## '$pname

# select all content, including newlines
# see https://github.com/chmln/sd/issues/146
multilineRegex='(?:\n|.)+?'

# regex to be replaced
multilineBound=$bound$multilineRegex$bound

cd "$PRJ_ROOT"/pkgs || exit

# enable multi line regex
sd --flags m \
  "$multilineBound" "$patchContent" \
  ./sources.toml
