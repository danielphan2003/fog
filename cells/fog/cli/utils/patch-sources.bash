sourceFile="$PKGS_PATH/${1:-"all-packages"}.toml"

# package name
pname="$2"

# content to replace with
patchContent="$3"

# set boundary for patching
bound='## '$pname

# select all content, including newlines
# see https://github.com/chmln/sd/issues/146
multilineRegex='(?:\n|.)+?'

# regex to be replaced
multilineBound="$bound$multilineRegex$bound"

# enable multi line regex
sd --flags m \
  "$multilineBound" "$patchContent" \
  "$sourceFile"

git add "$sourceFile"
